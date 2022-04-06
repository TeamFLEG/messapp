import 'package:flutter/material.dart';


class JoinMess extends StatefulWidget {
  const JoinMess({Key? key}) : super(key: key);

  @override
  State<JoinMess> createState() => _JoinMessState();

}

class _JoinMessState extends State<JoinMess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                  prefixIcon: const Icon(Icons.search, color: Color.fromRGBO(53, 53, 53, 1.0)),
                  hintText: "Join By Mess Name or Mess ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Email field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("Joined the mess");
                  },
                  child: const Text("Join Now"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}