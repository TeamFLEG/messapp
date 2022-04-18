import 'package:flutter/material.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/widgets/primary_button.dart';

class UserAttendance extends StatelessWidget {
  const UserAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(head: "Attendance"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        PrimaryButton(
          btnName: "Scan QR code",
          action: () {
            Navigator.pushNamed(context, '/user-attendance-view');
          },
        ),
      ]),
    );
  }
}
