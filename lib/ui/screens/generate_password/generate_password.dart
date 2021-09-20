import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/logic/features/password_generator/password_generator.dart';
import 'package:password_manager/ui/screens/add_new_account/add_new_account.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class GeneratePassword extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _text = useValueNotifier<bool>(false);
    final password = useValueNotifier<String>('');

    final _passwordLength = useValueNotifier<double>(16.0);
    final _uppercase = useValueNotifier<bool>(true);
    final _lowercase = useValueNotifier<bool>(false);
    final _symbols = useValueNotifier<bool>(true);
    final _numbers = useValueNotifier<bool>(true);

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
                      child: ValueListenableBuilder<String>(
                          valueListenable: password,
                          builder: (context, value, snapshot) {
                            return Text(
                              value,
                              style: TextThemes.hedline_10
                                  .copyWith(color: ColorPalette.c3A3943),
                            );
                          }),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      final pass = generatePassword(
                        isNumber: _numbers.value,
                        upperCase: _uppercase.value,
                        lowerCase: _lowercase.value,
                        isSpecial: _symbols.value,
                        length: _passwordLength.value.toInt(),
                      );
                      print(pass);
                      _text.value = !_text.value;
                      password.value = pass;
                    },
                    child: SvgPicture.asset(
                        'assets/svg_icons/generate_password.svg'),
                  ),
                ],
              ),
              ValueListenableBuilder<bool>(
                builder: (context, isText, child) {
                  return isText
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
                      : Container();
                },
                valueListenable: _text,
              ),
              ValueListenableBuilder(
                valueListenable: _passwordLength,
                builder: (BuildContext context, double value, Widget? child) {
                  return Text('Length: ${_passwordLength.value.toInt()}',
                      style: TextThemes.hedline_5
                          .copyWith(color: ColorPalette.c9FA2B2));
                },
              ),
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
                      child: ValueListenableBuilder(
                        builder: (BuildContext context, value, Widget? child) {
                          return CupertinoSlider(
                              thumbColor: ColorPalette.c53c1fc,
                              activeColor: ColorPalette.c53c1fc,
                              //divisions: 28,
                              value: _passwordLength.value,
                              min: 4.0,
                              max: 32.0,
                              onChanged: (value) {
                                _passwordLength.value = value;
                              });
                        },
                        valueListenable: _passwordLength,
                      ),
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
                          _uppercase.value = !_uppercase.value;
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _uppercase,
                          builder: (_, value, __) {
                            return CupertinoSwitch(
                                activeColor: ColorPalette.c53c1fc,
                                value: value,
                                onChanged: (bool value) {
                                  _uppercase.value = value;
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
                          _lowercase.value = !_lowercase.value;
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _lowercase,
                          builder: (_, value, __) {
                            return CupertinoSwitch(
                                activeColor: ColorPalette.c53c1fc,
                                value: value,
                                onChanged: (bool value) {
                                  _lowercase.value = value;
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
                          _symbols.value = !_symbols.value;
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _symbols,
                          builder: (_, value, __) {
                            return CupertinoSwitch(
                                activeColor: ColorPalette.c53c1fc,
                                value: value,
                                onChanged: (bool value) {
                                  _symbols.value = value;
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
                          _numbers.value = !_numbers.value;
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _numbers,
                          builder: (_, value, __) {
                            return CupertinoSwitch(
                                activeColor: ColorPalette.c53c1fc,
                                value: value,
                                onChanged: (bool value) {
                                  _numbers.value = value;
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // todo create pass record
                  Navigator.of(context).push(CupertinoPageRoute(builder: (ctx){

                    return AddNewAccount(password: password.value,);
                  }));
                },
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
