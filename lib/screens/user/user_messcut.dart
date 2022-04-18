import 'package:flutter/material.dart';
import 'package:messapp/widgets/primary_button.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import '../../theme/palette.dart';

class UserMessCut extends StatefulWidget {
  const UserMessCut({Key? key}) : super(key: key);

  @override
  _UserMessCutState createState() => _UserMessCutState();
}

class _UserMessCutState extends State<UserMessCut> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // int countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(head: "Mess Cut"),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Text(
                  'Minimum 3 days mess cut required',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Palette.myMaroon,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No. of days',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Palette.myMaroon,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 20, 0, 0),
                            child: Container(
                              width: 160,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: const Color(0xFF9E9E9E),
                                  width: 1,
                                ),
                              ),
                              child: null,
                              // child: FlutterFlowCountController(
                              //   decrementIconBuilder: (enabled) => FaIcon(
                              //     FontAwesomeIcons.minus,
                              //     color: enabled
                              //         ? Color(0xDD000000)
                              //         : Color(0xFFEEEEEE),
                              //     size: 20,
                              //   ),
                              //   incrementIconBuilder: (enabled) => FaIcon(
                              //     FontAwesomeIcons.plus,
                              //     color: enabled
                              //         ? FlutterFlowTheme.of(context)
                              //         .primaryColor
                              //         : Color(0xFFEEEEEE),
                              //     size: 20,
                              //   ),
                              //   countBuilder: (count) => Text(
                              //     count.toString(),
                              //     style: GoogleFonts.getFont(
                              //       'Roboto',
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              //   count: countControllerValue ??= 3,
                              //   updateCount: (count) => setState(
                              //           () => countControllerValue = count),
                              //   stepSize: 1,
                              //   minimum: 3,
                              //   maximum: 30,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 24),
                      child: PrimaryButton(
                        btnName: "Take Mess Cut",
                        action: () {
                          Navigator.pop(context);
                        },
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
