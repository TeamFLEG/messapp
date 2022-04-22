import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class DatabaseManager {
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  CollectionReference adminRef = FirebaseFirestore.instance.collection('admin');
  CollectionReference messRef = FirebaseFirestore.instance.collection('mess');
  CollectionReference systemRef =
      FirebaseFirestore.instance.collection('system');

  User user = FirebaseAuth.instance.currentUser!;

  Future<List<Object?>> getMC() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('messID', isEqualTo: user.uid)
        .get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
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

  int getUserCount() {
    // Get userdata of specific uid
    late int count = 0;
    systemRef.doc('userCount').get().then((value) {
      count = value['count'];
    });
    return count;
  }

  Future<int> getPerDayCost() async {
    var pdc = 0;
    try {
      await adminRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        pdc = value['perDayCost'];
      });
    } catch (e) {
      print(e);
    }
    return pdc;
  }

  Future<int> getEffectiveDays() async {
    var efd = 0;
    try {
      await adminRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        efd = value['effectiveDays'];
      });
    } catch (e) {
      print(e);
    }
    return efd;
  }

  Future<void> addBillDetails(int ed, int expense) {
    return adminRef
        .doc(user.uid)
        .set({
          'effectiveDays': ed,
          'expense': expense,
          'perDayCost': (expense / ed).ceil(),
        }, SetOptions(merge: true))
        .then((value) => print("Bill details Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateProfileDataAdmin(
      BuildContext context, String name, int phone, String addr) {
    return adminRef
        .doc(user.uid)
        .set({
          'fullName': name,
          'phone': phone,
          'address': addr,
        }, SetOptions(merge: true))
        .then((value) => SnackBarMessage.snackBarMessage(
            content: 'Profile updated successfully', context: context))
        .catchError((error) => SnackBarMessage.snackBarMessage(
            content: 'Failed to add user: $error', context: context));
  }

  generateBill() {
    userRef
        .where('messID', isEqualTo: user.uid)
        .get()
        .then((querySnapshot) async {
      int perDayCost = await getPerDayCost();
      int effDays = await getEffectiveDays();
      int userCount = getUserCount();
      querySnapshot.docs.forEach((element) {
        var messcut = element['messcut'];
        var result = (perDayCost * (effDays - messcut)) / userCount;
        userRef.doc(element.id).update({'billAmount': result});
      });
    });
  }

  Future<void> addMemberToMess(String? uid) {
    return userRef
        .doc(uid)
        .set({
          'messID': user.uid,
        }, SetOptions(merge: true))
        .then((value) => print("Member added successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  incrementAdmin() {
    systemRef
        .where('type', isEqualTo: 'admin')
        .get()
        .then((querySnapshot) async {
      querySnapshot.docs.forEach((element) {
        systemRef.doc(element.id).update({'count': FieldValue.increment(1)});
      });
    });
  }

  incrementUser() {
    systemRef
        .where('type', isEqualTo: 'user')
        .get()
        .then((querySnapshot) async {
      querySnapshot.docs.forEach((element) {
        systemRef.doc(element.id).update({'count': FieldValue.increment(1)});
      });
    });
  }

  incrementMess() {
    systemRef
        .where('type', isEqualTo: 'mess')
        .get()
        .then((querySnapshot) async {
      querySnapshot.docs.forEach((element) {
        systemRef.doc(element.id).update({'count': FieldValue.increment(1)});
      });
    });
  }
}
