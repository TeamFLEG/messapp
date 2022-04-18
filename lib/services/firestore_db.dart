import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messapp/services/firestore_path.dart';
import 'package:messapp/services/firestore_service.dart';
import 'package:messapp/models/members.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  final String uid;

  FirestoreDatabase({required this.uid});

  final _firestoreService = FirestoreService.instance;

// create new user (member)
  createUser(Member user) async {
    await _firestoreService.setData(
      path: FirestorePath.user(user.mid),
      data: user.toMap(),
    );

    // increment user count by 1
    await _firestoreService.setData(
      path: FirestorePath.counts(),
      data: {
        'users': FieldValue.increment(1),
      },
      merge: true,
    );
    if (user.isManager()) {
      // create new document in managers collection
      String managerId = await _firestoreService.createDocument(
        collectionPath: FirestorePath.managers(),
        data: {
          'uid': user.mid,
          'name': user.fullName,
          'assignedFund': 0,
        },
      );
    }
  }

  Future<int> getUserCount() async {
    final data = await _firestoreService.getData(path: FirestorePath.counts());
    return data!['users'];
  }

  Future<int> getTotalFunds() async {
    final data = await _firestoreService.getData(path: FirestorePath.counts());
    return data!['totalFunds'];
  }
}
