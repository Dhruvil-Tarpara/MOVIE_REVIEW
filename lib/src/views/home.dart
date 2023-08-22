import 'package:flutter/material.dart';
import 'package:movie_review/src/provider/firebase/firestore/firebase_cloud.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseCloudHelper.firebaseCloudHelper.insertData();
          },
          child: const Text("hello"),
        ),
      ),
    );
  }
}
