import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/bloc/operation/operation_bloc.dart';
import 'package:movie_review/src/provider/firebase/auth/auth.dart';
import 'package:movie_review/src/provider/firebase/auth/model.dart';
import 'package:movie_review/src/utils/extension/uuid.dart';
import 'package:movie_review/src/utils/hive/hive.dart';
import 'package:movie_review/src/utils/hive/hive_key.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/utils/sim_iccid.dart';
import 'package:movie_review/src/views/details.dart';
import 'package:movie_review/src/views/drawer.dart';
import 'package:movie_review/src/views/movie.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool? isVerifiey;
  @override
  void initState() {
    super.initState();
    Global.users = Users.fromJson(HiveHelper.hiveHelper.get(HiveKeys.user));
  }

  void storData() async {
    isVerifiey = await FirebaseAuthHelper.firebaseAuthHelper.getCurrentUser();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (!(isVerifiey ?? false)) {
          await showEmailDialog(context);
        }
      },
    );
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: height(context: context) * 0.01,
              ),
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
                height: height(context: context) * 0.01,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      context
                          .read<MovieDataBloc>()
                          .add(const MovieDataEvent.refreshData());
                      await getIccId();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        ConstColor.primary3,
                      ),
                    ),
                    child: FxText(
                      text: ConstString.allMovie,
                      color: ConstColor.primary2,
                    ),
                  ),
                  SizedBox(
                    width: width(context: context) * 0.02,
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<MovieDataBloc>().add(
                            MovieDataEvent.searchUser(
                              Global.users.id.toString(),
                            ),
                          );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        ConstColor.primary3,
                      ),
                    ),
                    child: FxText(
                      text: ConstString.myJournal,
                      color: ConstColor.primary2,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              itemBuilder: (context, index) {
                                return InkWell(
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
                                    ).then(
                                      (value) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                    );
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                            child: CachedNetworkImage(
                                              height: height(context: context) *
                                                  0.24,
                                              width: width(context: context),
                                              imageUrl: data[index].image!,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Shimmer.fromColors(
                                                baseColor: ConstColor.white,
                                                highlightColor:
                                                    ConstColor.primary3,
                                                child: Container(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              RatingBar.builder(
                                                initialRating:
                                                    calculateAverageRating(
                                                  data[index]
                                                      .rating!
                                                      .values
                                                      .toList(),
                                                ),
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                tapOnlyMode: true,
                                                glow: false,
                                                updateOnDrag: false,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                itemSize: 20,
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: ConstColor.primary2,
                                                  size: 18,
                                                ),
                                                onRatingUpdate:
                                                    (double value) {},
                                              ),
                                              SizedBox(
                                                width: width(context: context) *
                                                    0.02,
                                              ),
                                              FxText(
                                                text: calculateAverageRating(
                                                        data[index]
                                                            .rating!
                                                            .values
                                                            .toList())
                                                    .toStringAsFixed(1),
                                                size: 14,
                                                color: ConstColor.primary1,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          error: (massage) => Center(
                            child: FxText(text: massage),
                          ),
                        ),
                      ),
                    ],
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
          if (Global.users.emailVarify ?? false) {
            context.read<MovieDataBloc>().add(const MovieDataEvent.getData());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddMovie(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: FxText(
                  text: ConstString.emailVerify,
                  color: Colors.red,
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.white,
              ),
            );
          }
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

  Future<void> showEmailDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: FxText(
            text: ConstString.emailVerify,
            color: ConstColor.black,
            size: 24,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const FxText(
                text: ConstString.cancel,
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuthHelper
                    .firebaseAuthHelper.firebaseAuth.currentUser!
                    .sendEmailVerification()
                    .then((value) async => await FirebaseAuthHelper
                        .firebaseAuthHelper
                        .getCurrentUser())
                    .then((value) => Navigator.pop(context));
              },
              child: const FxText(text: ConstString.ok),
            ),
          ],
        );
      },
    );
  }
}

