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

  Future<String?> getRole() async {
    // Check user in user collection
    final uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      // Get reference to Firestore collection
      await adminRef.doc(uid).get();
      return 'adminRef';
    } catch (e) {
      try {
        // Get reference to Firestore collection
        var userRef = FirebaseFirestore.instance.collection('user');
        await userRef.doc(uid).get();
        return 'user';
      } catch (er) {
        print('user not found');
      }
    }
    return null;
  }

  Future<void> addBillDetails(int ed, int expense) {
    return adminRef
        .doc(user.uid)
        .set({
          'effectiveDays': ed,
          'expense': expense,
        })
        .then((value) => print("Bill details Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
