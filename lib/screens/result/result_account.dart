import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class ResultAccount extends StatefulWidget {
  const ResultAccount({Key? key}) : super(key: key);

  @override
  _ResultAccountState createState() => _ResultAccountState();
}

class _ResultAccountState extends State<ResultAccount> {
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
                            'Account identifier:',
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
                                    'nik_87@tut.by',
                                    style: TextThemes.hedline_10
                                        .copyWith(color: ColorPalette.c3A3943),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Text.rich(
                            TextSpan(
                              text: 'Found in ',
                              style: TextThemes.hedline_2
                                  .copyWith(color: ColorPalette.c3A3943),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '2 ',
                                    style: TextThemes.hedline_15
                                        .copyWith(color: ColorPalette.c53c1fc)),
                                TextSpan(
                                    text: 'breaches:',
                                    style: TextThemes.hedline_2
                                        .copyWith(color: ColorPalette.c3A3943)),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 17),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            tileColor: ColorPalette.white,
                            title: Text(
                              'Adobe',
                              style: TextThemes.hedline_10,
                            ),
                            subtitle: Text(
                              '4 Dec, 2019 at 03:00 AM ',
                              style: TextThemes.hedline_9
                                  .copyWith(color: ColorPalette.c616E7C),
                            ),
                            trailing:
                                SvgPicture.asset('assets/svg_icons/Button.svg'),
                            leading:
                                Image.asset('assets/images/Rectangle 12.png'),
                          ),
                          SizedBox(height: 20),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            tileColor: ColorPalette.white,
                            title: Text(
                              'Apple',
                              style: TextThemes.hedline_10,
                            ),
                            subtitle: Text(
                              '4 Dec, 2019 at 03:00 AM ',
                              style: TextThemes.hedline_9
                                  .copyWith(color: ColorPalette.c616E7C),
                            ),
                            trailing:
                                SvgPicture.asset('assets/svg_icons/Button.svg'),
                            leading: Image.asset('assets/images/image 24.png'),
                          ),
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
