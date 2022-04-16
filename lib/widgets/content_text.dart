import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {
  const ContentText({Key? key,
    required this.text,
    required this.value
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Color(0xFF535353),
              fontWeight: FontWeight.bold,
              fontSize: 15

          ),
        ),
        Text(
          value,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}