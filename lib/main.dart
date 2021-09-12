import 'package:flutter/material.dart';
import 'package:password_manager/screens/add_new_account/add_new_account.dart';
import 'package:password_manager/screens/choose%20password/choose_password.dart';
import 'package:password_manager/screens/login/login.dart';
import 'package:password_manager/screens/main_of/main_of.dart';
import 'package:password_manager/screens/passwords/passwords.dart';
import 'package:password_manager/screens/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}
