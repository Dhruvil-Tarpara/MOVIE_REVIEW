import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/src/constant/colors.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/constant/strings.dart';
import 'package:movie_review/src/constant/widgets/text.dart';
import 'package:movie_review/src/provider/bloc/data/movie_data_bloc.dart';
import 'package:movie_review/src/provider/firebase/auth/auth.dart';
import 'package:movie_review/src/utils/hive/hive.dart';
import 'package:movie_review/src/utils/hive/hive_key.dart';
import 'package:movie_review/src/utils/media_query.dart';
import 'package:movie_review/src/views/login.dart';

class FxDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const FxDrawer({
    super.key,
    required this.drawerKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ConstColor.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: height(context: context) * 0.08),
            width: width(context: context),
            decoration: BoxDecoration(
              color: ConstColor.primary2.withOpacity(0.2),
              border: Border.symmetric(
                horizontal: BorderSide(color: ConstColor.black, width: 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (Global.users.url != null)
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(Global.users.url ?? ""),
                      )
                    : const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(Global.userImage),
                      ),
                SizedBox(
                  height: height(context: context) * 0.02,
                ),
                FxText(
                  text: Global.users.email!,
                  size: 16,
                  color: ConstColor.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: height(context: context) * 0.02,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: width(context: context),
              child: ElevatedButton(
                onPressed: () {
                  context.read<MovieDataBloc>().add(
                        MovieDataEvent.searchUser(
                          Global.users.id.toString(),
                        ),
                      );
                  drawerKey.currentState!.closeDrawer();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    ConstColor.primary1,
                  ),
                ),
                child: FxText(
                  text: ConstString.myJournal,
                  size: 16,
                  color: ConstColor.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: width(context: context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuthHelper.firebaseAuthHelper.firebaseAuth.signOut();
                  HiveHelper.hiveHelper.set(HiveKeys.login, false);
                  drawerKey.currentState!.closeDrawer();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    ConstColor.white,
                  ),
                  side: MaterialStatePropertyAll(
                    BorderSide(
                      color: ConstColor.black,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FxText(
                      text: ConstString.logout,
                      size: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: width(context: context) * 0.02,
                    ),
                    const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
