import 'package:flutter/material.dart';
// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// Login import
import 'package:messapp/screens/login_page.dart';
// Color palette import
import 'theme/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MessApp",
      theme: ThemeData(
        primarySwatch: Palette.myMaroon,
        fontFamily: 'Raleway'
      ),
      home: const LoginPage(),
    );
  }
}

