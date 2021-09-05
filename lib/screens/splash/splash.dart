import 'package:flutter/material.dart';
import 'package:password_manager/components/decoration_box.dart';
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
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: decorationBox(),
        child: Center(
          child: Image.asset('assets/images/keyhole167.png'),
        ),
      ),
    );
  }
}
