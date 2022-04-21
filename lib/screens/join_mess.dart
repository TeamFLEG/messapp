import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messapp/models/mess.dart';
import 'package:messapp/widgets/mess_card.dart';

class JoinMess extends StatefulWidget {
  const JoinMess({Key? key}) : super(key: key);

  @override
  State<JoinMess> createState() => _JoinMessState();
}

class _JoinMessState extends State<JoinMess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const <Widget>[
                      SizedBox(
                        height: 75.0,
                      ),
                      Text(
                        "Join Mess",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextFormField(
                      //   // controller: _emailController,
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(Icons.search,
                      //         color: Color.fromRGBO(53, 53, 53, 1.0)),
                      //     hintText: "Join By Mess Name or Mess ID",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     filled: true,
                      //     fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance.collection('mess').get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children: snapshot.data!.docs.map((doc) {
                            return MessCard(
                              cardTitle: doc['messName'],
                              cardSubtitle: doc['location'],
                              messID: doc['messID'],
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
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<Mess>> getMessList() => FirebaseFirestore.instance
      .collection('mess')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Mess.fromJSON(doc.data())).toList());
}
