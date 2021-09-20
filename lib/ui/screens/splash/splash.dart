import 'package:flutter/material.dart';
import 'package:password_manager/ui/widgets/decoration_box.dart';
import 'package:password_manager/logic/features/master_password/mutations/create.dart';
import 'package:password_manager/logic/features/master_password/mutations/load_master_pass_status.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/ui/screens/choose%20password/choose_password.dart';
import 'package:password_manager/ui/screens/login/login.dart';
import 'dart:async';

import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();


    LoadMasterPassStatus();

  }

  @override
  Widget build(BuildContext context) {
    return VxNotifier(
      mutations: {LoadMasterPassStatus:(ctx,mutation){
       final exists = (mutation.store as AppState).masterPassExists;
       if(exists?? false){
         Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (BuildContext context) => Login()));
       } else {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (BuildContext context) => ChoosePassword()));

       }
      }},
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: decorationBox(),
          child: Center(
            child: Image.asset('assets/images/keyhole167.png'),
          ),
        ),
      ),
    );
  }
}
