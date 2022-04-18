/*
This class represent all possible CRUD operation for Firestore.
It contains all generic implementation needed based on the provided document
path and documentID,since most of the time in Firestore design, we will have
documentID and path for any document and collections.
 */

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Future<DocumentSnapshot> getDocument({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    return reference.get();
  }

  Future<Map<String, dynamic>?> getData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final document = await reference.get();
    return document.data();
  }

  Future<String> createDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.collection(collectionPath);
    DocumentReference doc = await reference.add(data);
    return doc.id;
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete: $path');
    await reference.delete();
  }
}