import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/screens/subscription/subscription.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double val = 16;
  var _faceId = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextThemes.hedline_6,
              ),
              Text(
                'Security',
                style: TextThemes.hedline_5.copyWith(
                  color: ColorPalette.c9FA2B2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Change main password',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svg_icons/arrow.svg'))
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Login with Face ID',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _faceId = !_faceId;
                          });
                        },
                        child: CupertinoSwitch(
                          activeColor: ColorPalette.c53c1fc,
                          value: _faceId,
                          onChanged: (bool value) {
                            setState(() {
                              _faceId = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Clear clipboard after',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      Row(
                        children: [
                          Text(
                            'not set',
                            style: TextThemes.hedline_5
                                .copyWith(color: ColorPalette.c9FA2B2),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child:
                                SvgPicture.asset('assets/svg_icons/arrow.svg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Will clear all data copied to the clipboard after'
                '\na certain time',
                style:
                    TextThemes.hedline_16.copyWith(color: ColorPalette.c9FA2B2),
              ),
              Text(
                'About App',
                style:
                    TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Subscription()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 54,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subscribe',
                          style: TextThemes.hedline_2
                              .copyWith(color: ColorPalette.c3A3943),
                        ),
                        GestureDetector(
                            onTap: () {
                            },
                            child: SvgPicture.asset('assets/svg_icons/arrow.svg'))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terms of Use',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svg_icons/arrow.svg'))
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Privacy Policy',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svg_icons/arrow.svg'))
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Support',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svg_icons/arrow.svg'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
