import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messapp/models/mess.dart';
import 'package:messapp/widgets/mess_card.dart';
// import 'package:messapp/widgets/snack_bar_message.dart';

class JoinMess extends StatefulWidget {
  const JoinMess({Key? key}) : super(key: key);

  @override
  State<JoinMess> createState() => _JoinMessState();
}

class _JoinMessState extends State<JoinMess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      "Join Mess",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      // controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search,
                            color: Color.fromRGBO(53, 53, 53, 1.0)),
                        hintText: "Join By Mess Name or Mess ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<Mess>>(
              stream: getMessList(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                      "Something went wrong. Error message : ${snapshot.error}");
                } else if (snapshot.hasData) {
                  final messData = snapshot.data!;
                  print(messData);
                  return ListView(
                    children: messData.map(buildMessCards).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessCards(Mess mess) {
    return (MessCard(cardTitle: mess.messName, cardSubtitle: mess.location));
  }

  Stream<List<Mess>> getMessList() => FirebaseFirestore.instance
      .collection('mess')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Mess.fromJSON(doc.data())).toList());
}
