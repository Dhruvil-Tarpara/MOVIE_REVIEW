import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movie_review/src/constant/global.dart';
import 'package:movie_review/src/provider/firebase/firestore/movie_model.dart';

class FirebaseCloudHelper {
  FirebaseCloudHelper._();
  static final FirebaseCloudHelper firebaseCloudHelper =
      FirebaseCloudHelper._();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  late CollectionReference collectionReference;
  final String _collectionName = "allMovie";

  createCollection() {
    collectionReference = firebaseFirestore.collection(_collectionName);
  }

  Future<List<Movie>> getData() async {
    QuerySnapshot<Object?> snapshot = await collectionReference.get();
    return snapshot.docs.map((e) => Movie.stream(e)).toList();
  }

  Future<void> insertData({required Movie movie}) async {
   await collectionReference.doc(movie.movieId).set(movie.toJson());
  }

  Future<void> upDateData(
      {required String doc, required Map<String, dynamic> data}) async {
    await collectionReference.doc(doc).update(data);
  }

  Future<void> deleteData({required String doc}) async {
   await collectionReference.doc(doc).delete();
  }

  Future<String?> uplodeImage({required String key, required File file}) async {
    try {
      await firebaseStorage.ref("${Global.users.id}/$key").putFile(file);
      final url =
          await firebaseStorage.ref("${Global.users.id}/$key").getDownloadURL();
      return url;
    } on FirebaseException catch (_) {
      return null;
    }
  }

  Future<bool> deleteImage({required String key}) async {
    try {
      await firebaseStorage.ref("${Global.users.id}/$key").delete();
      return true;
    } on FirebaseException catch (_) {
      return false;
    }
  }
}
