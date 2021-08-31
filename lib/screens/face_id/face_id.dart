import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class FaceID extends StatefulWidget {
  const FaceID({Key? key}) : super(key: key);

  @override
  State<FaceID> createState() => _FaceIDState();
}

class _FaceIDState extends State<FaceID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorPalette.ce5e5e5,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg_icons/back.svg',
                  height: 45,
                  width: 45,
                  //color: ColorPalette.cC6C5CA,
                ),
                SizedBox(height: 21),
                Text(
                  'Login with Face ID',
                  style: TextThemes.hedline_22,
                ),
                SizedBox(height: 9),
                Text(
                  'Use Face ID for quick authorization and \n'
                  'ensure the safety of your data',
                  style: TextThemes.hedline_2
                      .copyWith(color: ColorPalette.c616E7C),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Image.asset('assets/images/fase128.png'),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip for now',
                      style: TextThemes.hedline_4.copyWith(color: ColorPalette.c53c1fc),
                    ),),
                SizedBox(height: 36),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(20),
                    onPressed: () {},
                    color: Colors.white,
                    child: Text(
                      'Use Face ID',
                      style: TextThemes.hedline_4
                          .copyWith(color: ColorPalette.c53c1fc),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
