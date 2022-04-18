import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  CollectionReference adminRef = FirebaseFirestore.instance.collection('admin');

  User user = FirebaseAuth.instance.currentUser!;

  static Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('admin').get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
  }

  String getUserName() {
    // Get userdata of specific uid
    late String username = '';
    adminRef.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      username = value['fullName'].toString();
    });
    if (username == '') {
      username = 'Admin';
    }
    return username;
  }

  Future<void> addBillDetails(int ed, int expense) {
    return adminRef
        .doc(user.uid)
        .set({
          'effectiveDays': ed,
          'expense': expense,
        }, SetOptions(merge: true))
        .then((value) => print("Bill details Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
