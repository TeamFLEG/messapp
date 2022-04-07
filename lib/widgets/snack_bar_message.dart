import 'package:flutter/material.dart';

class SnackBarMessage {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarMessage({required String content, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBarMessage.customSnackBar(
        content: 'No user found for that email.',
      ),
    );
  }
}