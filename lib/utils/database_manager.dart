import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class DatabaseManager {
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  CollectionReference adminRef = FirebaseFirestore.instance.collection('admin');
  CollectionReference messRef = FirebaseFirestore.instance.collection('mess');

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

  int getPerDayCost() {
    adminRef.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      return int.parse(value['perDayCost']);
    });
    return 0;
  }

  int getMessCut() {
    adminRef.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      return int.parse(value['perDayCost']);
    });
    return 0;
  }

  int getEffectiveDays() {
    adminRef.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      return int.parse(value['effectiveDays']);
    });
    return 30;
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

  Future<void> updateBill(BuildContext context) async {
    int perDayCost = getPerDayCost();
    int messCut = getMessCut();
    int effDays = getEffectiveDays();
    try {
      var querySnapshots = await userRef.get();
      for (var doc in querySnapshots.docs) {
        await doc.reference.update({
          'billAmount': perDayCost * (effDays - messCut),
        });
      }
      SnackBarMessage.snackBarMessage(
          content: 'Bill Generated and Send to all users successfully',
          context: context);
    } catch (e) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred $e', context: context);
    }
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
}
