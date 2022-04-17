import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.btnName, required this.action})
      : super(key: key);

  final String btnName;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ElevatedButton(
          onPressed: () => action(),
          child: Text(btnName),
        ),
      ),
    );
  }
}
