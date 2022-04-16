import 'package:flutter/material.dart';

import '../theme/palette.dart';


class MessMenu extends StatefulWidget {
  const MessMenu({Key? key}) : super(key: key);

  @override
  _MessMenuState createState() => _MessMenuState();
}

class _MessMenuState extends State<MessMenu> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // static const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Palette.myMaroon,
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Text(
                      'Menu',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Palette.myMaroon,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Text(
                  'Bakker Mess Service',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 7,
                  initialIndex: 0,
                  child: Column(
                    children: const [
                        TabBar(
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
                            Tab(
                              text: 'Tue',
                            ),
                            Tab(
                              text: 'Wed',
                            ),
                            Tab(
                              text: 'Thu',
                            ),
                            Tab(
                              text: 'Fri',
                            ),
                            Tab(
                              text: 'Sat',
                            ),
                          ],
                        ),


                      Expanded(
                        child: TabBarView(
                          children: [
                            MenuSection(),
                            MenuSection(),
                            MenuSection(),
                            MenuSection(),
                            MenuSection(),
                            MenuSection(),
                            MenuSection(),

                          ],
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
  const MenuSection({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        MenuCard(foodItem: "Dosa", mealPeriod: "Breakfast"),
        Divider(
          indent: 40,
          endIndent: 40,
          color:
          Palette.myMaroon,
        ),
        MenuCard(foodItem: "Rice&Chicken", mealPeriod: "Lunch"),
        Divider(
          indent: 40,
          endIndent: 40,
          color:
          Colors.red,
        ),
        MenuCard(foodItem: "Biriyani", mealPeriod: "Dinner"),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key,
  required this.foodItem,
  required this.mealPeriod}): super(key: key);

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
                      borderRadius:
                      BorderRadius.circular(20),
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
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                        child: Row(
                          mainAxisSize:
                          MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Text(
                              mealPeriod,
                              style:
                              const TextStyle(
                                fontFamily:
                                'Raleway',
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.edit_outlined,
                              color:
                              Colors.black,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          foodItem,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            color:
                            Colors.black,
                            fontSize: 30,
                            fontWeight:
                            FontWeight.bold,
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

