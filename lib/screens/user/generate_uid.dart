import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/custom_appbar.dart';

class GenerateUid extends StatefulWidget {
  const GenerateUid({Key? key}) : super(key: key);

  @override
  State<GenerateUid> createState() => _GenerateUidState();
}

class _GenerateUidState extends State<GenerateUid> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var userName = user.uid.toString();

    return Scaffold(
      appBar: const CustomAppBar(head: "Generate UID"),
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
