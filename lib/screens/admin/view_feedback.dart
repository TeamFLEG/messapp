import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/widgets/profile_pic.dart';

class ViewFeedBacks extends StatefulWidget {
  const ViewFeedBacks({Key? key}) : super(key: key);

  @override
  State<ViewFeedBacks> createState() => _ViewFeedBacksState();
}

class _ViewFeedBacksState extends State<ViewFeedBacks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        head: 'View Feedbacks',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('feedback').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                shrinkWrap: true,
                children: snapshot.data!.docs.map((doc) {
                  return FeedbackCard(content: doc['feedback']);
                }).toList(),
              );
            } else {
              // or your loading widget here
              return const SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x28000000),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFDBE2E7),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ProfilePic(picRadius: 20.0),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            content,
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            'Apr 25, 2022',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
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
        ),
      ),
    );
  }
}
