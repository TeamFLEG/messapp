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
              Text(
                'Attendance Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Palette.myMaroon,
                ),
              ),
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
                          Navigator.pushNamed(context, '/qr-scan');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Palette.myMaroon,
                          ),
                        ),
                      ),
                      // child: FFButtonWidget(
                      //   onPressed: () {
                      //     print('Button pressed ...');
                      //   },
                      //   text: 'Generate QR code',
                      //   options: FFButtonOptions(
                      //     width: 200,
                      //     height: 40,
                      //     color: FlutterFlowTheme.of(context).primaryColor,
                      //     textStyle:
                      //         FlutterFlowTheme.of(context).subtitle2.override(
                      //               fontFamily: 'Poppins',
                      //               color: Colors.white,
                      //             ),
                      //     borderSide: BorderSide(
                      //       color: Colors.transparent,
                      //       width: 1,
                      //     ),
                      //     borderRadius: 12,
                      //   ),
                      // ),
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
