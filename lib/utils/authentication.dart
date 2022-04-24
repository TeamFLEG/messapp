import 'package:messapp/utils/database_manager.dart';

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
      User user = FirebaseAuth.instance.currentUser!;
      user.updateDisplayName(name);
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      if (user.emailVerified) {
        navigatorKey.currentState!.pushNamed('/mess-select');
      } else {
        SnackBarMessage.snackBarMessage(
          content: 'Please verify your email address',
          context: context,
        );
      }
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
      User? user = userCredential.user!;
      bool isAdmin = await DatabaseManager().checkIfAdmin(user.uid);
      if (isAdmin) {
        navigatorKey.currentState!.pushNamed('/admin-dashboard');
      } else {
        navigatorKey.currentState!.pushNamed('/user-dashboard');
      }
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
    final Future<bool> isGoogleSignedIn = _googleSignIn.isSignedIn();
    final bool status;
    try {
      status = await isGoogleSignedIn;
      if (status) {
        await _googleSignIn.disconnect();
      }
      await FirebaseAuth.instance.signOut();
      navigatorKey.currentState!.pushNamed('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarMessage.customSnackBar(
          content: 'Error signing out. Try again. Error message : $e',
        ),
      );
    }
  }

  // Google Authentication
  static Future<void> signInWithGoogle(
      {required BuildContext context, required registered}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

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
        await auth.signInWithCredential(credential);
        if (registered) {
          navigatorKey.currentState!.pushNamed('/user-dashboard');
        } else {
          navigatorKey.currentState!.pushNamed('/mess-select');
        }
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
  }

  static Future changePassword(String newPassword, BuildContext context) async {
    try {
      FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred with error message $e', context: context);
    } catch (e) {
      SnackBarMessage.snackBarMessage(
          content: 'Error occurred with error message $e', context: context);
    }
  }

  static Future resetPassword(email, BuildContext context) async {
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

  static void deleteUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      navigatorKey.currentState!.pushNamed('/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        SnackBarMessage.snackBarMessage(
            content:
                'The user must re-authenticate before this operation can be executed.',
            context: context);
      }
    }
  }
}
