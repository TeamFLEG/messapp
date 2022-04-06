import 'package:flutter/material.dart';


class CreateMess extends StatefulWidget {
  const CreateMess({Key? key}) : super(key: key);

  @override
  State<CreateMess> createState() => _CreateMessState();

}

class _CreateMessState extends State<CreateMess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Register Mess",
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
                  labelText: "Email",
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
              TextFormField(
                // controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Mess Manager Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mess manager name field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                // controller: _passwordController
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
              ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("Registration completed");
                  },
                  child: const Text("Complete Registration"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}