import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudHelper {
  FirebaseCloudHelper._();
  static final FirebaseCloudHelper firebaseCloudHelper =
      FirebaseCloudHelper._();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  final String _collectionName = "allMovie";

  createCollection() {
    collectionReference = firebaseFirestore.collection(_collectionName);
  }

  Stream<QuerySnapshot<Object?>> getData() {
    return collectionReference.snapshots();
  }

  void insertData() {
    collectionReference.add({"hello": ""});
  }

  void upDateData({
    required String doc,
  }) {
    collectionReference.doc(doc).update({});
  }

  void deleteData({required String doc}) {
    collectionReference.doc(doc).delete();
  }
}
