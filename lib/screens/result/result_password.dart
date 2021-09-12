import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class ResultPassword extends StatefulWidget {
  const ResultPassword({Key? key}) : super(key: key);

  @override
  _ResultPasswordState createState() => _ResultPasswordState();
}

class _ResultPasswordState extends State<ResultPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.cFCFCFE,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 235,
              child: Image.asset(
                'assets/images/Backgroundtop.png',
                //fit: BoxFit.cover,
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: Cross,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorPalette.c53c1fc,
                            ),
                            width: 45,
                            height: 45,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/svg_icons/Left Icon.svg'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Text(
                            'Results',
                            style: TextThemes.hedline_11,
                          ),
                          Container(
                            width: 45,
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorPalette.cFCFCFE,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password (has prefix):',
                            style: TextThemes.hedline_5
                                .copyWith(color: ColorPalette.c9FA2B2),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorPalette.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: 54,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'OB0A7',
                                    style: TextThemes.hedline_10
                                        .copyWith(color: ColorPalette.c3A3943),
                                  ),
                                  SvgPicture.asset('assets/svg_icons/warning.svg'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Text.rich(
                            TextSpan(
                              text: 'Found ',
                              style: TextThemes.hedline_2
                                  .copyWith(color: ColorPalette.c3A3943),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '900 ',
                                    style: TextThemes.hedline_15
                                        .copyWith(color: ColorPalette.cFF0000)),
                                TextSpan(
                                    text: 'times!',
                                    style: TextThemes.hedline_2
                                        .copyWith(color: ColorPalette.c3A3943)),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text('Please ensure that you change this password'
                              '\nanywhere you are using it.'
                              '\n'
                              '\nWe highly recommend using a strong, unique'
                              '\npassword for each site/account.', style: TextThemes.hedline_2.copyWith(color: ColorPalette.c3A3943),),
                          Text(''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
