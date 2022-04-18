import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  int count = 0;

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return user
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
          'messcut': count,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.remove,
                                      color: Palette.myMaroon,
                                      size: 30.0,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (count > 0) {
                                          count--;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 15.0),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 30.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 15.0),
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.add,
                                      color: Palette.myMaroon,
                                      size: 30.0,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (count < 30) {
                                          count++;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
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
                          addUser();
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
