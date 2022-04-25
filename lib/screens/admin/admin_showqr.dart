import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:messapp/widgets/custom_appbar.dart';

import 'package:firebase_auth/firebase_auth.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({Key? key}) : super(key: key);

  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String userName = user.uid;

    final messRef = FirebaseFirestore.instance.collection('mess');
    // var userName = messRef.doc('20FLqPBXpuhgQ8jLl7BfNI5we9q1').snapshots().data['messID'];

    return Scaffold(
      appBar: const CustomAppBar(head: "Attendance Register"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70.0),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
            //   child: TextField(
            //     controller: controller,
            //     decoration: InputDecoration(
            //       hintText: "Enter text to generate QR code",
            //       suffixIcon: IconButton(
            //         icon: const Icon(Icons.done),
            //         onPressed: () {
            //           setState(() {});
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            QrImage(
              data: userName,
              size: 200,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
