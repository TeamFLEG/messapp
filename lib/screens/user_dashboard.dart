// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:messapp/screens/dashboard_model.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              alignment: const AlignmentDirectional(-0.050000000000000044, 1.0),
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
                    child: Image.network(
                      'https://picsum.photos/id/237/444/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
              child: Text(
                'Hi, User',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [

                DashboardCard(cardIcon: Icons.menu_book_sharp, cardName: "Menu", cardColor: Color(0xFF99D5F3)),
                DashboardCard(cardIcon: Icons.payment, cardName: "Payments", cardColor: Color(0xFFFDCE84)),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                DashboardCard(cardIcon: Icons.payment, cardName: "Mess Details", cardColor: Color(0xFFFDCE84)),
                DashboardCard(cardIcon: Icons.payment, cardName: "Register", cardColor: Color(0xFF99D5F3))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
