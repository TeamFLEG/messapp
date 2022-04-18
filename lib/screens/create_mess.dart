import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/main.dart';
import 'package:messapp/models/admin.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class CreateMess extends StatefulWidget {
  const CreateMess({Key? key}) : super(key: key);

  @override
  State<CreateMess> createState() => _CreateMessState();
}

class _CreateMessState extends State<CreateMess> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _messNameController;
  late TextEditingController _managerNameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _messNameController = TextEditingController();
    _managerNameController = TextEditingController();
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
                controller: _messNameController,
                decoration: InputDecoration(
                  labelText: "Mess Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1.0),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Mess name field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _managerNameController,
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
                    createAdmin(
                      messName: _messNameController.text,
                      fullName: _managerNameController.text,
                      phone: int.parse(_phoneController.text),
                      address: _addressController.text,
                      joinedTS: Timestamp.now(),
                    );
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

  Future createAdmin({
    required String messName,
    required String fullName,
    required int phone,
    required String address,
    required Timestamp joinedTS,
  }) async {
    // Referencing to the document
    final loggedInUser = FirebaseAuth.instance.currentUser!;
    final adminDoc = FirebaseFirestore.instance.collection('admin').doc(loggedInUser.uid);
    final admin = Admin(
      id: adminDoc.id,
      messName: messName,
      fullName: fullName,
      email: loggedInUser.email.toString(),
      phoneNumber: phone,
      address: address,
      joinedTS: joinedTS,
    );
    final adminJSON = admin.toJSON();
    try {
      await adminDoc.set(adminJSON);
      navigatorKey.currentState!.pushNamed('/admin-dashboard');
    } catch (e) {
      SnackBarMessage.snackBarMessage(content: '$e', context: context);
    }
  }
}
