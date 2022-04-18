import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/utils/authentication.dart';
import 'package:messapp/widgets/primary_button.dart';
import 'package:messapp/widgets/custom_appbar.dart';

import '../../widgets/profile_pic.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const CustomAppBar(head: "User Settings"),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: const BoxDecoration(
                // color: Color(0xFFFDCE84),
                ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfilePic(picRadius: 40),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.displayName}',
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '${user.email}',
                              style: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonCard(
              btnName: "Edit Profile",
              clicked: () {
                Navigator.pushNamed(context, '/edit-profile');
              }),
          ButtonCard(
              btnName: "Change Password",
              clicked: () {
                Navigator.pushNamed(context, '/change-pass');
              }),
          ButtonCard(
              btnName: "Notification Settings",
              clicked: () {
                print("null");
              }),
          ButtonCard(
              btnName: "Terms of Services",
              clicked: () {
                print("null");
              }),
          ButtonCard(
              btnName: "Delete Account",
              clicked: () {
                Authentication.deleteUser(context);
              }),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 40),
            child: PrimaryButton(
                btnName: "Log Out",
                action: () {
                  Authentication.logoutUser(context);
                }),
          ),
        ],
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.btnName, required this.clicked})
      : super(key: key);

  final String btnName;
  final Function clicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clicked(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF262D34),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF090F13),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        btnName,
                        style: const TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF95A1AC),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
