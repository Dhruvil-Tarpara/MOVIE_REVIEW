import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_review/src/provider/bloc/bloc/opration_bloc.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';
import 'package:movie_review/src/utils/hive/hive.dart';
import 'package:movie_review/src/utils/hive/hive_key.dart';
import 'package:movie_review/src/views/home.dart';
import 'package:movie_review/src/views/login.dart';
import 'package:movie_review/src/views/sign_up.dart';

import 'provider/bloc/auth/login_bloc.dart';
import 'provider/bloc/data/movie_data_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseCloudHelper.firebaseCloudHelper.createCollection();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(
          create: (context) => MovieDataBloc()
            ..add(
              const MovieDataEvent.getData(),
            ),
        ),
        BlocProvider(
          create: (context) => OprationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (HiveHelper.hiveHelper.get(HiveKeys.login) ?? false)
            ? const HomeScreen()
            : (HiveHelper.hiveHelper.get(HiveKeys.signUp) ?? false)
                ? const LoginScreen()
                : const SignUpScreen(),
      ),
    );
  }
}
