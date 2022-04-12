import 'package:cloud_firestore/cloud_firestore.dart';
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
                    final messName = _messNameController.text;
                    final managerName = _managerNameController.text;
                    final phone = int.parse(_phoneController.text);
                    final address = _addressController.text;
                    createAdmin(messName: messName, managerName: managerName, phone: phone, address: address);
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
    required String managerName,
    required int phone,
    required String address
  }) async {
    // Referencing to the document
    final adminDoc = FirebaseFirestore.instance.collection('admin').doc();
    final admin = Admin(id: adminDoc.id, messName: messName, managerName: managerName, phoneNumber: phone, address: address);
    final adminJSON = admin.toJSON();
    try {
      await adminDoc.set(adminJSON);
      navigatorKey.currentState!.pushNamed('adminDashboard');
    } catch (e) {
      SnackBarMessage.snackBarMessage(content: '$e', context: context);
    }
  }
}