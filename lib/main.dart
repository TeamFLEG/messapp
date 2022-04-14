import 'package:flutter/material.dart';
// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messapp/screens/admin_dashboard.dart';
import 'package:messapp/screens/auth_page.dart';
import 'package:messapp/screens/forgot_password_page.dart';
import 'package:messapp/screens/mess_select.dart';
import 'package:messapp/screens/user_dashboard.dart';
import 'package:messapp/screens/join_mess.dart';
import 'firebase_options.dart';
// Color palette import
import 'theme/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MessApp",
      theme: ThemeData(primarySwatch: Palette.myMaroon, fontFamily: 'Raleway'),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/login': (context) => const AuthPage(),
        '/adminDashboard': (context) => const AdminDashboard(),
        '/userDashboard': (context) => const UserDashboard(),
        '/mess-select': (context) => const MessSelect(),
        '/forgotPassword': (context) => const ForgotPasswordPage(),
        '/join-mess': (context) => const JoinMess(),
      },
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                  "Something went wrong connecting to server. Please try again later."),
            );
          } else if (snapshot.hasData) {
            return const UserDashboard();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
