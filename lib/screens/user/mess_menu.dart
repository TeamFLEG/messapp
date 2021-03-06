import 'package:flutter/material.dart';
import '../../theme/palette.dart';
import '../../widgets/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';

class MessMenu extends StatefulWidget {
  const MessMenu({Key? key}) : super(key: key);

  @override
  _MessMenuState createState() => _MessMenuState();
}

class _MessMenuState extends State<MessMenu> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  User user = FirebaseAuth.instance.currentUser!;

  // static const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      // floatingActionButton: FloatingActionButton(onPressed: () { Navigator.pushNamed(context, "/edit-food-menu"); },
      // child: const Icon(Icons.edit)),
      appBar: const CustomAppBar(head: "Menu"),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigatorKey.currentState!.popAndPushNamed('/edit-food-menu');
          },
          child: const Icon(Icons.edit)),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // const Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              //   child: Text(
              //     'Bakker Mess Service',
              //     style: TextStyle(
              //       fontFamily: 'Raleway',
              //     ),
              //   ),
              // ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: true,
                        labelColor: Palette.myMaroon,
                        // labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        indicatorColor: Palette.myAmber,
                        tabs: [
                          Tab(
                            text: 'Sun',
                          ),
                          Tab(
                            text: 'Mon',
                          ),
                          // Tab(
                          //   text: 'Tue',
                          // ),
                          // Tab(
                          //   text: 'Wed',
                          // ),
                          // Tab(
                          //   text: 'Thu',
                          // ),
                          // Tab(
                          //   text: 'Fri',
                          // ),
                          // Tab(
                          //   text: 'Sat',
                          // ),
                        ],
                      ),
                      Expanded(
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('meal')
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              return TabBarView(
                                children: snapshot.data!.docs.map((doc) {
                                  return MenuSection(
                                      mrng: doc['breakfast'],
                                      noon: doc['lunch'],
                                      night: doc['dinner']);
                                }).toList(),
                              );
                            } else {
                              // or your loading widget here
                              return const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator());
                            }
                          },
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
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection(
      {Key? key, required this.mrng, required this.noon, required this.night})
      : super(key: key);

  final String mrng;
  final String noon;
  final String night;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        MenuCard(foodItem: mrng, mealPeriod: "Breakfast"),
        const Divider(
          indent: 40,
          endIndent: 40,
          color: Palette.myMaroon,
        ),
        MenuCard(foodItem: noon, mealPeriod: "Lunch"),
        const Divider(
          indent: 40,
          endIndent: 40,
          color: Colors.red,
        ),
        MenuCard(foodItem: night, mealPeriod: "Dinner"),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key, required this.foodItem, required this.mealPeriod})
      : super(key: key);

  final String foodItem;
  final String mealPeriod;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
          child: Container(
            width: 300,
            height: 130,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Palette.myMaroon,
              ),
            ),
            child: Stack(
              children: [
                ClipRect(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/join_mess_card-bg.jpeg',
                      width: 300,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              mealPeriod,
                              style: const TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          foodItem,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
