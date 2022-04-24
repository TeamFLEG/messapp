import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/widgets/primary_button.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import '../../theme/palette.dart';
import 'package:intl/intl.dart';

class UserMessCut extends StatefulWidget {
  const UserMessCut({Key? key}) : super(key: key);

  @override
  _UserMessCutState createState() => _UserMessCutState();
}

class _UserMessCutState extends State<UserMessCut> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  Future<void> addUserMessCut(num messCut) {
    // Call the user's CollectionReference to add a new user
    return user
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
          'messcut': messCut,
        }, SetOptions(merge: true))
        .then((value) => print("Mess cut Added"))
        .catchError((error) => print("Failed to add mess cut: $error"));
  }

  DateTime lastDayCurrentMonth = DateTime.utc(DateTime.now().year,DateTime.now().month,DateTime.now().day+10);
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime(2022, 4, 29));

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
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
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: pickDateRange,
                          child: Text(DateFormat('dd/MM/yyyy').format(start)),
                        ),
                        Text('To'),
                        ElevatedButton(
                          onPressed: pickDateRange,
                          child: Text(DateFormat('dd/MM/yyyy').format(lastDayCurrentMonth)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Mess Cut: ${difference.inDays} days',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    // const SizedBox(height: 16),
                    // Row(mainAxisAlignment: MainAxisAlignment.center,
                    // children: [
                    //   Expanded(
                    //     child: ElevatedButton(
                    //       child: Text('${start.year}/${start.month}/${start.day}'),
                    //       onPressed: pickDateRange,
                    //       ),
                    // ),
                    // const SizedBox(width: 12),
                    // Expanded(
                    //   child: ElevatedButton(
                    //     child: Text('${end.year}/${end.month}/${end.day}'),
                    // onPressed: pickDateRange,
                    // ),
                    // ),
                    // const SizedBox(height:16),
                    // Text(
                    //   'Mess Cut: ${difference.inDays} days',
                    //   style: TextStyle(fontSize: 32),
                    // ),
                    //  Padding(
                    //   padding:
                    //       const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsetsDirectional.fromSTEB(
                    //             0, 20, 0, 0),
                    //         child: Container(
                    //           width: 160,
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(25),
                    //             shape: BoxShape.rectangle,
                    //             border: Border.all(
                    //               color: const Color(0xFF9E9E9E),
                    //               width: 1,
                    //             ),
                    //           ),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               GestureDetector(
                    //                 child: const Icon(
                    //                   Icons.remove,
                    //                   color: Palette.myMaroon,
                    //                   size: 30.0,
                    //                 ),
                    //                 onTap: () {
                    //                   setState(() {
                    //                     if (count > 0) {
                    //                       count--;
                    //                     }
                    //                   });
                    //                 },
                    //               ),
                    //               const SizedBox(width: 15.0),
                    //               Text(
                    //                 count.toString(),
                    //                 style: const TextStyle(
                    //                   fontFamily: 'Raleway',
                    //                   fontSize: 30.0,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //               const SizedBox(width: 15.0),
                    //               GestureDetector(
                    //                 child: const Icon(
                    //                   Icons.add,
                    //                   color: Palette.myMaroon,
                    //                   size: 30.0,
                    //                 ),
                    //                 onTap: () {
                    //                   setState(() {
                    //                     if (count < 30) {
                    //                       count++;
                    //                     }
                    //                   });
                    //                 },
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 24),
                      child: PrimaryButton(
                        btnName: "Take Mess Cut",
                        action: () {
                          addUserMessCut(difference.inDays);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    //],
                    //),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}
