import 'package:flutter/material.dart';
import 'package:password_manager/components/decoration_box.dart';
import 'package:password_manager/screens/add_login/add_login.dart';
import 'package:password_manager/screens/logins/views/search_login.dart';
import 'package:password_manager/theme/text_theme.dart';

class Logins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: decorationBox(),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: TextThemes.hedline_0),
            Text('Choose a master password', style: TextThemes.hedline_21),
            Text(
              'To unlock the app, you will need to create'
              ' \na master password. Please note that for '
              '\nsecurity reasons it cannot be recovered.',
              style: TextThemes.hedline_2,
            ),

          ],
        ),
      ),
    );
  }
}
