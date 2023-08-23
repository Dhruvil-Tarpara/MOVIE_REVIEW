import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  void insertData({required Movie movie}) {
    collectionReference.add(movie.toJson());
  }

  void upDateData({
    required String doc,
  }) {
    collectionReference.doc(doc).update({});
  }

  void deleteData({required String doc}) {
    collectionReference.doc(doc).delete();
  }

  Future<String?> uplodeImage({required String key,required File file}) async {
    try {
      await firebaseStorage.ref(key).putFile(file);
      final url = await firebaseStorage.ref(key).getDownloadURL();
      return url;
    } on FirebaseException catch (_) {
      return null;
    }
  }
}
