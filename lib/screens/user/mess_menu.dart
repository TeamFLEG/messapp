import 'package:flutter/material.dart';

import '../../theme/palette.dart';
import '../../widgets/custom_appbar.dart';

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
      // floatingActionButton: FloatingActionButton(onPressed: () { Navigator.pushNamed(context, "/edit-food-menu"); },
      // child: const Icon(Icons.edit)),
      appBar: const CustomAppBar(head: "Menu"),
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
                            MenuSection(
                                mrng: "Bread & Jam",
                                noon: "Sadhya",
                                night: "Kanji"),
                            MenuSection(
                                mrng: "Idly & Sambar",
                                noon: "Rice & Fish",
                                night: "Chicken Biriyani"),
                            MenuSection(
                                mrng: "Puttu & Kadala",
                                noon: "Rice & Chicken",
                                night: "Poori & Bhaaji"),
                            MenuSection(
                                mrng: "Dosa & Sambar",
                                noon: "Rice & Egg",
                                night: "Idiyappam & Kadala"),
                            MenuSection(
                                mrng: "Poori Masala",
                                noon: "Rice & Fish",
                                night: "Chicken Biriyani"),
                            MenuSection(
                                mrng: "Idly & Sambar",
                                noon: "Rice & Egg",
                                night: "Noolputtu"),
                            MenuSection(
                                mrng: "Idly & Sambar",
                                noon: "Rice & Fish",
                                night: "Puttu & Fish"),
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
                            const Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                              size: 24,
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
