// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/main.dart';
import 'package:messapp/screens/dashboard_model.dart';
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
    // final user = FirebaseAuth.instance.currentUser!;

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
                        navigatorKey.currentState!.pushNamed('/joinMessRegister');
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
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.56),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:
                      // user.photoURL != null
                      //     ? Image.network(
                      //         user.photoURL.toString(),
                      //         width: 100,
                      //         height: 100,
                      //         fit: BoxFit.contain,
                      //       )
                      //     :
                      Image.asset(
                              'assets/user.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                    // 'Hi, ${user.displayName}',
                    'Hi, User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'Members',
                        ),
                        Text(
                          '102',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'Mess Cut',
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'Guest',
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
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
