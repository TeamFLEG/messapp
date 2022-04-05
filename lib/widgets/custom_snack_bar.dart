import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}