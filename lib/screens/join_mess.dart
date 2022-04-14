import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Form(
            // key: _formKey,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    MessCard(cardTitle: 'Bakker Mess', cardSubtitle: 'Thrikkakara'),
                    MessCard(cardTitle: 'Sagar Mess', cardSubtitle: 'Kalamassery'),
                    MessCard(cardTitle: 'Sahara Mess', cardSubtitle: 'Kalamassery'),
                    MessCard(cardTitle: 'Alakananda Mess', cardSubtitle: 'Kalamassery'),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 15.0,
          )
        ],
      ),
    );

  }
}
