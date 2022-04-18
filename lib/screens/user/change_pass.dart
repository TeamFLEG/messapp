import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/main.dart';
import 'package:messapp/utils/authentication.dart';
import 'package:messapp/widgets/custom_appbar.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _oldPWController;
  late TextEditingController _newPWController;
  late TextEditingController _confirmPWController;

  @override
  void initState() {
    super.initState();
    _oldPWController = TextEditingController();
    _newPWController = TextEditingController();
    _confirmPWController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: const CustomAppBar(head: "Change Password"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _oldPWController,
                enableSuggestions: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Old Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  if (value != null && value.length < 8) {
                    return 'Password must be minimum 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _newPWController,
                enableSuggestions: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "New Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  if (value != null && value.length < 8) {
                    return 'Password must be minimum 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _confirmPWController,
                enableSuggestions: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (value != _newPWController.text) {
                    return "Password doesn't match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Authentication.changePassword(_newPWController.text, context);
                  navigatorKey.currentState!.pop();
                },
                child: const Text("Change Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
