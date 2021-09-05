import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/screens/main_of/main_of.dart';
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
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.white,
        leadingWidth: 70,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              'assets/svg_icons/back.svg',
              height: 45,
              width: 45,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 21, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/fase128.png'),
              ],
            ),
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CupertinoButton(
                      disabledColor: ColorPalette.c53c1fc,
                      borderRadius: BorderRadius.circular(20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => MainOff()),
                        );
                      },
                      child: Text(
                        'Skip for now',
                        style: TextThemes.hedline_4
                            .copyWith(color: ColorPalette.c53c1fc),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: CupertinoButton(
                      alignment: Alignment.bottomCenter,
                      borderRadius: BorderRadius.circular(20),
                      onPressed: () {},
                      color: ColorPalette.c53c1fc,
                      child: Text(
                        'Use Face ID',
                        style: TextThemes.hedline_4
                            .copyWith(color: ColorPalette.white),
                      ),
                    ),
                  ),
                  //SizedBox(height: 30,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
