import 'package:flutter/material.dart';

import '../theme/palette.dart';
import '../widgets/profile_pic.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFDBE2E7),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: ProfilePic(
                      picURL:
                          'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=630&q=80'),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {},
                      style:  ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),

                      child: const Text("Change Photo",
                        style: TextStyle(
                          color: Palette.myMaroon,
                        ),),
                    ),
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              // controller: textController1,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
              ),
              style: const TextStyle(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF14181B),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              // controller: textController1,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintStyle: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
              ),
              style: const TextStyle(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF14181B),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),




        ],
      ),
    );
  }
}
