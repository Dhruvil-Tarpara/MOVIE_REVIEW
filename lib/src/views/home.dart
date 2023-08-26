import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/bloc/operation/operation_bloc.dart';
import 'package:movie_review/src/provider/firebase/auth/model.dart';
import 'package:movie_review/src/utils/hive/hive.dart';
import 'package:movie_review/src/utils/hive/hive_key.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/views/details.dart';
import 'package:movie_review/src/views/drawer.dart';
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
          (Global.users.url != null)
              ? CircleAvatar(
                  backgroundImage: NetworkImage(Global.users.url ?? ""),
                )
              : const CircleAvatar(
                  backgroundImage: AssetImage(Global.userImage),
                ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: FxDrawer(drawerKey: _key),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<MovieDataBloc>().add(const MovieDataEvent.refreshData());
          return Future.delayed(const Duration(milliseconds: 600));
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: height(context: context) * 0.06,
                child: CupertinoSearchTextField(
                  backgroundColor: ConstColor.primary3,
                  onChanged: (value) {
                    context.read<MovieDataBloc>().add(
                          MovieDataEvent.searchData(value),
                        );
                  },
                ),
              ),
              SizedBox(
                height: height(context: context) * 0.02,
              ),
              BlocBuilder<MovieDataBloc, MovieDataState>(
                builder: (context, state) => state.when(
                  initial: () => const SizedBox.shrink(),
                  loding: () => const Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  success: (data) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context.read<OperationBloc>().add(
                              OperationEvent.getData(
                                data[index].movieId.toString(),
                              ),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              movie: data[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          alignment: Alignment.bottomLeft,
                          height: height(context: context) * 0.24,
                          width: width(context: context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: ConstColor.primary2, width: 2),
                            image: DecorationImage(
                              image: NetworkImage(data[index].image!),
                              fit: BoxFit.cover,
                              opacity: 0.8,
                            ),
                          ),
                          child: Container(
                            height: height(context: context) * 0.13,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: ConstColor.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FxText(
                                  text: data[index].movieName!,
                                  size: 22,
                                  color: ConstColor.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                FxText(
                                  text: data[index].category!,
                                  size: 14,
                                  color: ConstColor.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                RatingBar.builder(
                                  initialRating: 5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: ConstColor.primary2,
                                    size: 18,
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
