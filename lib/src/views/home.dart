import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/constant/widgets/text_form_field.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/firebase/auth/auth.dart';
import 'package:movie_review/src/provider/firebase/auth/model.dart';
import 'package:movie_review/src/utils/hive/hive.dart';
import 'package:movie_review/src/utils/hive/hive_key.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/views/details.dart';
import 'package:movie_review/src/views/login.dart';
import 'package:movie_review/src/views/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Global.users = Users.fromJson(HiveHelper.hiveHelper.get(HiveKeys.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: ConstColor.white,
      appBar: AppBar(
        backgroundColor: ConstColor.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ConstColor.black),
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu_sharp,
            color: ConstColor.primary2,
          ),
        ),
        title: FxText(
          text: Global.users.userName ?? "",
          size: 16,
          color: ConstColor.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuthHelper.firebaseAuthHelper.firebaseAuth.signOut();
              HiveHelper.hiveHelper.set(HiveKeys.login, false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.logout,
              color: ConstColor.primary2,
            ),
          ),
          (Global.users.url != null)
              ? CircleAvatar(
                  backgroundImage: NetworkImage(Global.users.url ?? ""),
                )
              : const CircleAvatar(
                  backgroundImage: AssetImage(Global.userImage),
                ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<MovieDataBloc>().add(const MovieDataEvent.refreshData());
          return Future.delayed(const Duration(milliseconds: 600));
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              FxTextFormField(
                textInputType: TextInputType.text,
                onChanged: (value) {
                  context
                      .read<MovieDataBloc>()
                      .add(MovieDataEvent.searchData(value));
                },
                hintText: ConstString.search,
                prefix: const Icon(Icons.search),
              ),
              SizedBox(
                height: height(context: context) * 0.02,
              ),
              BlocBuilder<MovieDataBloc, MovieDataState>(
                builder: (context, state) => state.when(
                  initial: () => const SizedBox.shrink(),
                  loding: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  success: (data) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(movie: data[index],),
                          ),
                        );
                      },
                      title: FxText(text: data[index].movieName ?? ""),
                    ),
                  ),
                  error: (massage) => Center(
                    child: FxText(text: massage),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColor.primary2,
        onPressed: () {
          context.read<MovieDataBloc>().add(const MovieDataEvent.getData());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddMovie(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: ConstColor.white,
        ),
      ),
    );
  }

  Widget userImage() {
    return (Global.users.url != null)
        ? CircleAvatar(
            backgroundImage: NetworkImage(Global.users.url ?? ""),
          )
        : const CircleAvatar(
            backgroundImage: AssetImage(Global.uploadImage),
          );
  }
}
