import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class Passwords extends StatefulWidget {
  const Passwords({Key? key}) : super(key: key);

  @override
  _PasswordsState createState() => _PasswordsState();
}

class _PasswordsState extends State<Passwords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        titleSpacing: MediaQuery.of(context).size.width,

      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Passwords',
              style: TextThemes.hedline_6,
            ),
            subtitle: Text(
              '0 accounts',
              style: TextThemes.hedline_9.copyWith(color: ColorPalette.c3D3B3B),
            ),
            trailing: SvgPicture.asset('assets/svg_icons/add new.svg'),
          )
        ],
      ),
    );
  }
}
