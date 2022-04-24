import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class DatabaseManager {
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  CollectionReference adminRef = FirebaseFirestore.instance.collection('admin');
  CollectionReference messRef = FirebaseFirestore.instance.collection('mess');
  CollectionReference adminCountRef =
      FirebaseFirestore.instance.collection('adminCount');

  User user = FirebaseAuth.instance.currentUser!;

  Future<bool> checkIfAdmin(id) async {
    final admin = await adminRef.doc(id).get();
    if (admin.exists) {
      return true;
    } else {
      return false;
    }
  }

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

  getAdminUserCount() {
    int count = 0;
    adminCountRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => count = value['users']);
    return count;
  }

  Future<int> getUserCount() async {
    // Get userdata of specific uid
    late int count = 0;
    await adminCountRef.doc(user.uid).get().then((value) {
      count = value['users'];
    });
    return count;
  }

  Future<int> getPerDayCost(BuildContext context) async {
    var pdc = 0;
    try {
      await adminRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        pdc = value['perDayCost'];
      });
    } catch (e) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred!', context: context);
    }
    return pdc;
  }

  Future<int> getEstFees(BuildContext context) async {
    var est = 0;
    try {
      await adminRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        est = value['establishmentFees'];
      });
    } catch (e) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred!', context: context);
    }
    return est;
  }

  Future<int> getEffectiveDays(BuildContext context) async {
    var efd = 0;
    try {
      await adminRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        efd = value['effectiveDays'];
      });
    } catch (e) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred! Try again later', context: context);
    }
    return efd;
  }

  Future<void> addBillDetails(
      int ed, int expense, int pdc, BuildContext context) {
    return adminRef.doc(user.uid).set({
      'effectiveDays': ed,
      'establishmentFees': expense,
      'perDayCost': pdc,
    }, SetOptions(merge: true)).then((value) {
      SnackBarMessage.snackBarMessage(
          content: 'Bill added successfully', context: context);
    }).catchError((error) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred! Try again later', context: context);
    });
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

  generateBill(BuildContext context) {
    userRef
        .where('messID', isEqualTo: user.uid)
        .get()
        .then((querySnapshot) async {
      int perDayCost = await getPerDayCost(context);
      int effDays = await getEffectiveDays(context);
      int userCount = await getUserCount();
      int establishmentFees = await getEstFees(context);
      querySnapshot.docs.forEach((element) {
        var messcut = element['messcut'];
        var result = (perDayCost * (effDays - messcut)) +
            (establishmentFees / userCount);
        print(result);
        userRef.doc(element.id).update({'billAmount': result});
      });
    });
  }

  void addMemberToMess(
      String? userid, String messID, BuildContext context) async {
    await userRef.doc(userid).set({
      'messID': messID,
    }, SetOptions(merge: true)).then((value) {
      incrementUser(messID);
      SnackBarMessage.snackBarMessage(
          content: 'Member added successfully', context: context);
    }).catchError((error) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred. Error message : $error', context: context);
    });
  }

  incrementUser(String messID) {
    FirebaseFirestore.instance.collection('adminCount').doc(messID).update({
      'users': FieldValue.increment(1),
    });
  }
}
