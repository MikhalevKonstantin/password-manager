import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/components/decoration_box.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  bool monthly = true;

  void setMonthly() {
    monthly = true;
  }

  void setYearly() {
    monthly = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 342,
                child: Image.asset(
                  'assets/images/Group 8488.png',
                  fit: BoxFit.fill,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child:
                                SvgPicture.asset('assets/svg_icons/back.svg'),
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          'App Name Premium',
                          style: TextThemes.hedline_0
                              .copyWith(color: ColorPalette.c53c1fc),
                        ),
                        SizedBox(height: 48),
                        Image.asset('assets/images/keyhole118.png'),
                        SizedBox(height: 25),
                        Text('Remove completely all ads from'),
                        Text('the application'),
                        SizedBox(height: 12),
                        Text('Unlimited passwords'),
                        SizedBox(height: 12),
                        Text('Checking passwords for leaks'),
                        SizedBox(height: 30),
                        Text('Try 3-day free trial'),
                        Text('Then \$2.99 per week'),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: CupertinoButton(
                            alignment: Alignment.bottomCenter,
                            borderRadius: BorderRadius.circular(20),
                            onPressed: () {},
                            color: ColorPalette.c53c1fc,
                            child: Text(
                              ' Start Free Trial and Subscribe',
                              style: TextThemes.hedline_4
                                  .copyWith(color: ColorPalette.white),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 6, bottom: 6),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  // primary: Color(0xFF007AFF), //0xFF007AFF
                                  backgroundColor: monthly
                                      ? ColorPalette.white
                                      : ColorPalette.white,
                                  //0xFFE7E7EC gray 0xFFF2F2F7 white
                                  elevation: 4,
                                  minimumSize: Size(54.0, 54.0),

                                  side: BorderSide(
                                      color: monthly
                                          ? Color(0xFF007AFF)
                                          : Color(0xFFE7E7EC),
                                      width: 1.5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    monthly = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Monthly',
                                    ),
                                    Text(
                                      "\$2.50 / month",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6, bottom: 6),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: ColorPalette.c53c1fc,
                                  //0xFF007AFF
                                  backgroundColor: !monthly
                                      ? ColorPalette.white
                                      : ColorPalette.white,
                                  //0xFFE7E7EC gray 0xFFF2F2F7 white
                                  elevation: 4,
                                  minimumSize: Size(54.0, 54.0),

                                  side: BorderSide(
                                      color: !monthly
                                          ? Color(0xFF007AFF)
                                          : Color(0xFFE7E7EC),
                                      width: 1.5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    monthly = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Yearly',
                                    ),
                                    Text(
                                      "\$2.50 / year",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
