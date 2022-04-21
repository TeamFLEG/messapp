import 'package:flutter/material.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/theme/palette.dart';

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
                          Navigator.pushNamed(context, '/qr-generation');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Palette.myMaroon,
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
