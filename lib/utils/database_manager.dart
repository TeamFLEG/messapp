import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference adminRef =
      FirebaseFirestore.instance.collection('admin');
  final CollectionReference messRef =
      FirebaseFirestore.instance.collection('mess');

  static Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('admin').get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }

  static Future<void> getUserName() async {}
}
