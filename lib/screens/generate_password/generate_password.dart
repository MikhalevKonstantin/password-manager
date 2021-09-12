import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class GeneratePassword extends StatefulWidget {
  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  var _text = false;
  double val = 16;
  var _uppercase = true;
  var _lowercase = false;
  var _symbols = true;
  var _numbers = true;

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
                'Generate Password',
                style: TextThemes.hedline_6,
              ),
              Text('Generated Password',
                  style: TextThemes.hedline_5
                      .copyWith(color: ColorPalette.c9FA2B2)),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 54,
                    width: MediaQuery.of(context).size.width - 110,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'fbSNDCctQx34gCJny',
                        style: TextThemes.hedline_10
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _text = !_text;
                        });
                      },
                      child: SvgPicture.asset(
                          'assets/svg_icons/generate_password.svg')),
                ],
              ),
              _text
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/svg_icons/done.svg'),
                        Text(
                          'Password has been copied!',
                          style: TextThemes.hedline_9,
                        ),
                      ],
                    )
                  : Container(),
              Text('Length: ${val.toInt()}',
                  style: TextThemes.hedline_5
                      .copyWith(color: ColorPalette.c9FA2B2)),
              Container(
                height: 54,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        '4',
                        style: TextThemes.hedline_5
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: CupertinoSlider(
                          thumbColor: ColorPalette.c53c1fc,
                          activeColor: ColorPalette.c53c1fc,
                          //divisions: 28,
                          value: val,
                          min: 4.0,
                          max: 32.0,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                            });
                          }),
                    ),
                    Container(
                      child: Text(
                        '32',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Options',
                style:
                    TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
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
                        'Allow All Character Types',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svg_icons/done.svg'))
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
                        'Use Uppercase (A-Z)',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _uppercase = !_uppercase;
                          });
                        },
                        child: CupertinoSwitch(
                          activeColor: ColorPalette.c53c1fc,
                          value: _uppercase,
                          onChanged: (bool value) {
                            setState(() {
                              _uppercase = value;
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
                        'Use Lowercase (a-z)',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _lowercase = !_lowercase;
                          });
                        },
                        child: CupertinoSwitch(
                          activeColor: ColorPalette.c53c1fc,
                          value: _lowercase,
                          onChanged: (bool value) {
                            setState(() {
                              _lowercase = value;
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
                        'Include symbols (!@#%)',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _symbols = !_symbols;
                          });
                        },
                        child: CupertinoSwitch(
                          activeColor: ColorPalette.c53c1fc,
                          value: _symbols,
                          onChanged: (bool value) {
                            setState(() {
                              _symbols = value;
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
                        'Include numbers (0-9)',
                        style: TextThemes.hedline_2
                            .copyWith(color: ColorPalette.c3A3943),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _numbers = !_numbers;
                          });
                        },
                        child: CupertinoSwitch(
                          activeColor: ColorPalette.c53c1fc,
                          value: _numbers,
                          onChanged: (bool value) {
                            setState(() {
                              _numbers = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: ColorPalette.c53c1fc),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Create new record',
                        style: TextThemes.hedline_4
                            .copyWith(color: ColorPalette.c53c1fc),
                      ),
                    ),
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
