import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  static Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('admin').get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
  }

  static String getUserName() {
    // Get userdata of specific uid
    late String username = '';
    FirebaseFirestore.instance
        .collection('admin')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
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
      var adminRef = FirebaseFirestore.instance.collection('admin');
      await adminRef.doc(uid).get();
      return 'admin';
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
}
