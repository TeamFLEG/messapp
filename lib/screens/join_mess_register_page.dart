import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/main.dart';
import 'package:messapp/models/users.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class JoinMessRegisterPage extends StatefulWidget {
  const JoinMessRegisterPage({Key? key}) : super(key: key);

  @override
  State<JoinMessRegisterPage> createState() => _JoinMessRegisterPageState();
}

class _JoinMessRegisterPageState extends State<JoinMessRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Join Mess",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Complete the details to continue",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _phoneController,
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
                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp regExp = RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _addressController,
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
                    createUser(
                        phone: int.parse(_phoneController.text),
                        address: _addressController.text);
                  },
                  child: const Text("Complete Process"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createUser({required int phone, required String address}) async {
    // Referencing to the document
    final loggedInUser = FirebaseAuth.instance.currentUser!;
    final userDoc = FirebaseFirestore.instance.collection('user').doc(loggedInUser.uid);
    final user = Users(
      id: userDoc.id,
      fullName: loggedInUser.displayName.toString(),
      email: loggedInUser.email.toString(),
      phoneNumber: phone,
      address: address,
      joinedTS: Timestamp.now(),
    );
    final adminJSON = user.toJSON();
    try {
      await userDoc.set(adminJSON);
      navigatorKey.currentState!.pushNamed('/join-mess');
    } catch (e) {
      SnackBarMessage.snackBarMessage(content: '$e', context: context);
    }
  }

  Future createMess() async {

  }
}
