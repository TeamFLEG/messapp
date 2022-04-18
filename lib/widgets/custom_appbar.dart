import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({Key? key,
  required this.head}) : super(key: key);

  final String head;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(head),
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
