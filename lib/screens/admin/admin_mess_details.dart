import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/widgets/custom_appbar.dart';

import '../user/mess_details.dart';

class AdminMessDetails extends StatelessWidget {
  const AdminMessDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(head: 'Mess Details'),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('mess')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Center(
              child: Text(
                "Error data cannot be fetched",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontStyle: FontStyle.normal,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return MessDetailWidget(
              messName: data['messName'],
              owner: data['owner'],
              phoneNumber: data['phoneNumber'],
              location: data['location'],
            );
          }

          return const Text("loading");
        },
      ),
    );
  }
}
