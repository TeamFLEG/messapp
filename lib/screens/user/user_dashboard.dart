import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/screens/dashboard_model.dart';
import 'package:messapp/widgets/content_text.dart';

import '../../widgets/profile_pic.dart';

// import 'package:messapp/utils/authentication.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

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
                    const Align(
                      alignment: AlignmentDirectional(0.0, 0.56),
                      child: ProfilePic(
                          //Add URL here for Profile Picture
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
                    children: const [
                      ContentText(text: "Mess Id", value: "10"),
                      ContentText(text: "Mess Cut", value: "5"),
                      ContentText(text: "Dues", value: "0"),
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
                            cardIcon: Icons.payment,
                            cardName: "Menu",
                            cardColor: const Color(0xFF99D5F3),
                            cardAction: () {
                              Navigator.pushNamed(context, '/mess-menu');
                            }),
                        DashboardCard(
                          cardIcon: Icons.payment,
                          cardName: "Payments",
                          cardColor: const Color(0xFFFDCE84),
                          cardAction: () {
                            Navigator.pushNamed(context, '/user-payment');
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
                          cardName: "Mess Cut",
                          cardColor: const Color(0xFFFDCE84),
                          cardAction: () {
                            Navigator.pushNamed(context, '/user-messcut');
                          },
                        ),
                        DashboardCard(
                          cardIcon: Icons.payment,
                          cardName: "Attendance",
                          cardColor: const Color(0xFF99D5F3),
                          cardAction: () {
                            Navigator.pushNamed(context, '/user-attendance');
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
                          cardColor: const Color(0xFF99D5F3),
                          cardAction: () {
                            Navigator.pushNamed(context, '/mess-details');
                          },
                        ),
                        DashboardCard(
                          cardIcon: Icons.payment,
                          cardName: "Feedback",
                          cardColor: const Color(0xFFFDCE84),
                          cardAction: () {
                            Navigator.pushNamed(context, '/user-attendance');
                          },
                        ),
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
