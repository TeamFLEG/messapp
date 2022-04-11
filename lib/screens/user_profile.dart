import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messapp/utils/authentication.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    final name = FirebaseAuth.instance.currentUser!.displayName;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hey $name",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Authentication.logoutUser(context);
                    },
                    child: const Text("Sign Out"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
