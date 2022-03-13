import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authentication {
  static void registerUser(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static void loginUser(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static void loggedInStatus(BuildContext context) async {
    final emailID = FirebaseAuth.instance.currentUser?.email;
    var snackBar = SnackBar(content: Text("User with email id $emailID logged in"));
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      // not logged
      snackBar = const SnackBar(content: Text("Error! User not logged in."));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
