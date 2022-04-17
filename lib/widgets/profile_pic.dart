import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key,
  this.picRadius = 50,
  this.picURL}) : super(key: key);

  final double? picRadius;
  final String? picURL;

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.picRadius ?? 50.0,
      child:
      widget.picURL != null
          ? Image.network(
              widget.picURL.toString(),
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            )
          :
      Image.asset(
        'assets/user.png',
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}
