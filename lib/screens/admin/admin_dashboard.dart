import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/screens/dashboard_model.dart';
import 'package:messapp/utils/database_manager.dart';
import 'package:messapp/widgets/content_text.dart';
import 'package:messapp/widgets/custom_appbar.dart';

import '../../widgets/profile_pic.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser!;

  int userCount = DatabaseManager().getAdminUserCount() ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/user-settings');
                          // Authentication.logoutUser(context);
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      // const Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons'))
                    ],
                  ),
                ),
                Stack(
                  alignment:
                      const AlignmentDirectional(-0.050000000000000044, 1.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Image.asset(
                        'assets/red_ribbon.png',
                        width: MediaQuery.of(context).size.width - 40.0,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.56),
                      child: ProfilePic(
                        //TODO: Add URL here for Profile Picture
                        picURL: user.photoURL,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: Text(
                      'Hi, ${user.displayName}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContentText(
                        text: "Members",
                        value: (userCount.toString()),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardCard(
                            cardIcon: Icons.menu_book_sharp,
                            cardName: "Menu",
                            cardColor: const Color(0xFF99D5F3),
                            cardAction: () {
                              Navigator.pushNamed(context, '/mess-menu');
                            }),
                        DashboardCard(
                          cardIcon: Icons.payment,
                          cardName: "Statement",
                          cardColor: const Color(0xFFFDCE84),
                          cardAction: () {
                            Navigator.pushNamed(context, '/admin-statement');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardCard(
                            cardIcon: Icons.payment,
                            cardName: "Mess Details",
                            cardColor: const Color(0xFFFDCE84),
                            cardAction: () {
                              Navigator.pushNamed(
                                  context, '/admin-mess-details');
                            }),
                        DashboardCard(
                            cardIcon: Icons.payment,
                            cardName: "Attendance",
                            cardColor: const Color(0xFF99D5F3),
                            cardAction: () {
                              Navigator.pushNamed(context, '/admin-attendance');
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardCard(
                            cardIcon: Icons.payment,
                            cardName: "Members",
                            cardColor: const Color(0xFFFDCE84),
                            cardAction: () {
                              Navigator.pushNamed(context, '/mess-members');
                            }),
                        DashboardCard(
                            cardIcon: Icons.payment,
                            cardName: "View Feedbacks",
                            cardColor: const Color(0xFF99D5F3),
                            cardAction: () {
                              Navigator.pushNamed(context, '/view-feedbacks');
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            CustomAppBar(
              head: "Feedbacks",
            ),
            Text('No feedbacks till now! Come back later'),
          ],
        ),
      ),
    );
  }
}
