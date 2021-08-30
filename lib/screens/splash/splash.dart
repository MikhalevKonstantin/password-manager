import 'package:flutter/material.dart';
import 'dart:async';

import 'package:password_manager/screens/logins/logins.dart';
import 'package:password_manager/theme/color_theme.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Logins())));
  }

  @override
  Widget build(BuildContext context) {
    final stops = [0.0, 0.9];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1782ff),
            Color(0xff53c1fc),
            ],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/Group 8510.png'),
        ),
      ),
    );
  }
}
