import 'package:flutter/material.dart';

class MainHead extends StatelessWidget {

  const MainHead({Key? key,
    required this.text}): super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30.0,
      ),
    );
  }
}