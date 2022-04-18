import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Custom Widgets
import 'package:messapp/screens/admin/admin_dashboard.dart';
import 'package:messapp/screens/admin/mess_members.dart';
import 'package:messapp/screens/edit_profile.dart';

import 'package:messapp/screens/user/mess_menu.dart';
import 'package:messapp/screens/user/user_payment.dart';
import 'package:messapp/screens/user/user_dashboard.dart';
import 'package:messapp/screens/user/user_settings.dart';
import 'package:messapp/screens/user/user_messcut.dart';

import 'package:messapp/screens/auth_page.dart';
import 'package:messapp/screens/create_mess.dart';
import 'package:messapp/screens/forgot_password_page.dart';
import 'package:messapp/screens/mess_select.dart';
import 'package:messapp/screens/join_mess.dart';
import 'package:messapp/utils/database_manager.dart';
// import 'package:messapp/screens/join_mess_register_page.dart';

import 'package:messapp/screens/user/user_attendance.dart';

import 'package:messapp/screens/admin/admin_statement.dart';
// import 'package:messapp/screens/admin/admin_attendance.dart';
import 'package:messapp/screens/user/mess_details.dart';

import 'firebase_options.dart';

// Color palette import
import 'theme/palette.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
        '/admin-dashboard': (context) => const AdminDashboard(),
        '/user-dashboard': (context) => const UserDashboard(),
        '/mess-select': (context) => const MessSelect(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/join-mess': (context) => const JoinMess(),
        '/create-mess': (context) => const CreateMess(),
        '/user-settings': (context) => const UserSettings(),
        '/mess-members': (context) => const MessMembers(),
        '/mess-menu': (context) => const MessMenu(),
        '/user-payment': (context) => const UserPayment(),
        '/user-messcut': (context) => const UserMessCut(),
        '/edit-profile': (context) => const EditProfile(),
        '/user-attendance': (context) => const UserAttendance(),
        '/admin-statement': (context) => const AdminStatement(),
        // '/admin-attendance': (context) => const AdminAttendance(),
        '/mess-details': (context) => const MessDetails(),
      },
      home: const SplashScreen(),
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
            return const RoleSelector();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/messapp_logo.png', width: 500, height: 500),
        centered: true,
        duration: 2000,
        nextScreen: const MainPage());
  }
}

class RoleSelector extends StatelessWidget {
  const RoleSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('admin').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const AdminDashboard();
          } else {
            return const UserDashboard();
          }
        });
  }
}
