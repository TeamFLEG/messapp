import 'package:flutter/material.dart';
import 'package:messapp/widgets/custom_appbar.dart';

import '../../main.dart';

class AdminAttendance extends StatefulWidget {
  const AdminAttendance({Key? key}) : super(key: key);

  @override
  State<AdminAttendance> createState() => _AdminAttendanceState();
}

class _AdminAttendanceState extends State<AdminAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(head: "Attendance Register"),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: ElevatedButton(
                        onPressed: () {
                          navigatorKey.currentState!.pushNamed('/admin-showqr');
                        },
                        child: const Text(
                          'Generate QR',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
