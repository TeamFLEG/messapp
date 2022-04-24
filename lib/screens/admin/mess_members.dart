import 'package:flutter/material.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/theme/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessMembers extends StatefulWidget {
  const MessMembers({Key? key}) : super(key: key);

  @override
  _MessMembersState createState() => _MessMembersState();
}

class _MessMembersState extends State<MessMembers> {
  // TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  //   textController = TextEditingController();
  // }
  User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          
        });
      },
      child: Scaffold(
        appBar: const CustomAppBar(head: "Members"),
        backgroundColor: const Color(0xFFFFFFFF), //0xFFF1F4F8
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add-member');
          },
          backgroundColor: Palette.myMaroon,
          elevation: 8,
          child: const Icon(
            Icons.person_add_alt_1_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                // controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search,
                      color: Color.fromRGBO(53, 53, 53, 1.0)),
                  hintText: "Search Members By Mess Name or ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('user')
                      .where('messID', isEqualTo: user.uid)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((doc) {
                          return MemberCard(
                            cardTitle: doc['fullName'],
                            cardSubtitle: doc['phone'],
                            // messID: doc['messID'],
                          );
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
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: const [
            //         Text(
            //           "No new members Yet",
            //           style: TextStyle(
            //             color: Colors.grey,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         // const MemberCard(),
            //         // const MemberCard(),
            //         // Row(
            //         //   mainAxisSize: MainAxisSize.max,
            //         //   children: const [
            //         //     Padding(
            //         //       padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
            //         //       child: Text(
            //         //         'New Members',
            //         //         style: TextStyle(
            //         //           fontFamily: 'Lexend Deca',
            //         //           color: Color(0xFF8B97A2),
            //         //           fontSize: 14,
            //         //           fontWeight: FontWeight.w500,
            //         //         ),
            //         //       ),
            //         //     ),
            //         //   ],
            //         // ),
            //         // const MemberCard(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.cardTitle,
    required this.cardSubtitle,
  }) : super(key: key);

  final String cardTitle;
  final int cardSubtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFC8CED5),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/user.png',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          cardTitle,
                          style: const TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF15212B),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children:  [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                            child: Text(
                              "$cardSubtitle",
                              style: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
