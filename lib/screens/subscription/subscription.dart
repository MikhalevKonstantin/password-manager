import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Container(
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
                child: SingleChildScrollView(
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
                          child: SvgPicture.asset('assets/svg_icons/back.svg'),
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
                      Text(
                        'Remove completely all ads from \nthe application',
                        textAlign: TextAlign.center,
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      // Text('Remove completely all ads from'),
                      // Text('the application'),
                      SizedBox(height: 12),
                      Text(
                        'Unlimited passwords',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Checking passwords for leaks',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      SizedBox(height: 30),
                      Text.rich(
                        TextSpan(
                          text: 'Try 3-day free trial',
                          style: TextThemes.hedline_2
                              .copyWith(color: ColorPalette.c53c1fc),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nThen \$2.99 per week',
                                style: TextThemes.hedline_15
                                    .copyWith(color: ColorPalette.c53c1fc)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 58,
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(20),
                          onPressed: () {},
                          color: ColorPalette.c53c1fc,
                          child: Text(
                            'Start Free Trial and Subscribe',
                            style: TextThemes.hedline_4
                                .copyWith(color: ColorPalette.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            height: 58,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: monthly
                                    ? ColorPalette.white
                                    : ColorPalette.white,
                                side: BorderSide(
                                    color: monthly
                                        ? ColorPalette.c53c1fc
                                        : ColorPalette.c53c1fc,
                                    width: 1.5),
                              ),
                              onPressed: () {
                                setState(() {
                                  monthly = true;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Monthly',
                                    style: TextThemes.hedline_18,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "\$2.50 / month",
                                      style: TextThemes.hedline_19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 58,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: !monthly
                                    ? ColorPalette.white
                                    : ColorPalette.white,
                                //0xFFE7E7EC gray 0xFFF2F2F7 white
                                //elevation: 4,
                                //minimumSize: Size(54.0, 54.0),

                                side: BorderSide(
                                    color: !monthly
                                        ? ColorPalette.c53c1fc
                                        : ColorPalette.c53c1fc,
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
                                    style: TextThemes.hedline_18,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "\$2.50 / year",
                                      style: TextThemes.hedline_19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Your subscription will renew automatically every period and'
                        '\npayment will be charged toyour iTunes Account within 24 hours'
                        '\nprior to the end of the current period. Subscription automatically'
                        '\nrenews unless auto-renew is turned off at least 24-hours before'
                        '\nthe end of the current period. Any unused portion of a free trail'
                        '\nperiod will be forfeited when you purchase a subscription. You can'
                        '\nturn off auto-renewal by going to your Account Settings after'
                        '\npurchase. No cancellation of your subscription is allowed during'
                        '\nthe active subscription period.'
                        '\nBy using our app you agree to the Terms of Service and'
                        '\nPrivacy Policy.',
                        style: TextThemes.hedline_20,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
