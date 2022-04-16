import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  // Email Authentication
  static void registerUser(name, email, password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      navigatorKey.currentState!.pushNamed('/messSelect');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarMessage.customSnackBar(
            content: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarMessage.customSnackBar(
            content: 'The account already exists for that email.',
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarMessage.customSnackBar(
          content: '$e',
        ),
      );
    }
  }

  static Future loginUser(email, password, BuildContext context) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      navigatorKey.currentState!.pushNamed('/dashboard');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarMessage.snackBarMessage(
            content: 'No user found for that email.', context: context);
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarMessage.customSnackBar(
            content: 'Wrong password provided for that user.',
          ),
        );
      }
    }
  }

  static void loggedInStatus(BuildContext context) async {
    final emailID = FirebaseAuth.instance.currentUser?.email;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBarMessage.customSnackBar(
        content: 'User with email id $emailID logged in',
      ),
    );
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarMessage.customSnackBar(
          content: 'Error! User not logged in.',
        ),
      );
    }
  }

  static void logoutUser(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarMessage.customSnackBar(
          content: 'Error signing out. Try again. Error message : $e',
        ),
      );
    }
  }

  // Google Authentication
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarMessage.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarMessage.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarMessage.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }

    return user;
  }

  static Future resetPassword(email, BuildContext context) async {
    print(email);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      SnackBarMessage.snackBarMessage(
          content: "Password reset email sent", context: context);
      navigatorKey.currentState!.pushNamed('/login');
    } on FirebaseException catch (e) {
      SnackBarMessage.snackBarMessage(
          content: "${e.message}", context: context);
      navigatorKey.currentState!.pop();
    }
  }
}
