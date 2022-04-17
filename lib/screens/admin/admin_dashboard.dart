// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:messapp/screens/dashboard_model.dart';
import 'package:messapp/widgets/content_text.dart';

import '../../widgets/profile_pic.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // TODO : add route
                        // navigatorKey.currentState!.pushNamed('/joinMessRegister');
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        textAlign: TextAlign.left,
                      ),
                    ),
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                    // 'Hi, ${user.displayName}',
                    'Hi, Bakker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                    ContentText(text: "Members", value: "10"),
                    ContentText(text: "Mess Cut", value: "5"),
                    ContentText(text: "Guest", value: "0"),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      DashboardCard(
                          cardIcon: Icons.menu_book_sharp,
                          cardName: "Menu",
                          cardColor: const Color(0xFF99D5F3),
                          cardAction: () {
                            Navigator.pushNamed(context, '/mess-menu');
                          }
                      ),
                      DashboardCard(
                        cardIcon: Icons.payment,
                        cardName: "Payments",
                        cardColor: const Color(0xFFFDCE84),
                        cardAction: () {
                          Navigator.pushNamed(context, '/admin-payment');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DashboardCard(
                          cardIcon: Icons.payment,
                          cardName: "Mess Details",
                          cardColor: Color(0xFFFDCE84)),
                      DashboardCard(
                          cardIcon: Icons.payment,
                          cardName: "Register",
                          cardColor: Color(0xFF99D5F3))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
