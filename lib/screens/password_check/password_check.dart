import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class PasswordCheck extends StatefulWidget {
  const PasswordCheck({Key? key}) : super(key: key);

  @override
  State<PasswordCheck> createState() => _PasswordCheckState();
}

class _PasswordCheckState extends State<PasswordCheck> {
  var plus1 = true;
  var plus2 = true;
  bool _hidePass = true;

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Security',
                  style: TextThemes.hedline_6,
                ),
                SizedBox(
                  height: 27,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account check',
                          style: TextThemes.hedline_13,
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Check to see if any accounts associated with'
                          '\nyour email or username have been leaked.',
                          style: TextThemes.hedline_14,
                        ),
                        SizedBox(height: 20),
                        Divider(),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Check your account',
                                style: TextThemes.hedline_11
                                    .copyWith(color: ColorPalette.c53c1fc)),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  plus1 = !plus1;
                                });
                              },
                              child: plus1
                                  ? SvgPicture.asset(
                                      'assets/svg_icons/Plus.svg')
                                  : SvgPicture.asset(
                                      'assets/svg_icons/minus.svg'),
                            ),
                          ],
                        ),
                        plus1
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30),
                                  Text(
                                    'E-mail/Username',
                                    style: TextThemes.hedline_5
                                        .copyWith(color: ColorPalette.c9FA2B2),
                                  ),
                                  SizedBox(height: 8),
                                  TextField(
                                    style:
                                        TextStyle(color: ColorPalette.c3A3943),
                                    cursorColor: ColorPalette.c53c1fc,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorPalette.cD8DCE5),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorPalette.cD8DCE5),
                                      ),

                                      // labelStyle: TextThemes.hedline_2,
                                      // labelText: 'Enter Your Password1',
                                      // hintText: 'Enter Your Password',
                                      // hintStyle: TextThemes.hedline_3,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    child: CupertinoButton(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorPalette.c53c1fc,
                                        child: Text(
                                          'Check Breaches',
                                          style: TextThemes.hedline_4,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Note: Pastes are only checked for emails and'
                                    '\nas such will not return any results for'
                                    '\nusernames',
                                    style: TextThemes.hedline_14,
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                80,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: ColorPalette.c53c1fc),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Create new record',
                                            style:
                                                TextThemes.hedline_4.copyWith(
                                              color: ColorPalette.c53c1fc,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password check',
                          style: TextThemes.hedline_13,
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Check if your password has been leaked in'
                          '\nany known breaches. Your password will never'
                          '\nleave your device.',
                          style: TextThemes.hedline_14,
                        ),
                        SizedBox(height: 20),
                        Divider(),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check your password',
                              style: TextThemes.hedline_11.copyWith(
                                color: ColorPalette.c53c1fc,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  plus2 = !plus2;
                                });
                              },
                              child: plus2
                                  ? SvgPicture.asset(
                                      'assets/svg_icons/Plus.svg',
                                    )
                                  : SvgPicture.asset(
                                      'assets/svg_icons/minus.svg',
                                    ),
                            ),
                          ],
                        ),
                        plus2
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30),
                                  Text(
                                    'Password',
                                    style: TextThemes.hedline_5.copyWith(
                                      color: ColorPalette.c9FA2B2,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    style: TextStyle(
                                      color: ColorPalette.c3A3943,
                                    ),
                                    cursorColor: ColorPalette.c53c1fc,
                                    //controller: _passwordController,
                                    obscureText: _hidePass,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorPalette.cD8DCE5,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorPalette.cD8DCE5,
                                        ),
                                      ),

                                      // labelStyle: TextThemes.hedline_2,
                                      // labelText: 'Enter Your Password1',
                                      // hintText: 'Enter Your Password',
                                      // hintStyle: TextThemes.hedline_3,
                                      suffixIcon: IconButton(
                                        icon: _hidePass
                                            ? SvgPicture.asset(
                                                'assets/svg_icons/eyecl.svg',
                                                color: ColorPalette.c9FA2B2,
                                              )
                                            : SvgPicture.asset(
                                                'assets/svg_icons/eye.svg',
                                                color: ColorPalette.c9FA2B2,
                                              ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              _hidePass = !_hidePass;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    child: CupertinoButton(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorPalette.c53c1fc,
                                        child: Text(
                                          'Check Password',
                                          style: TextThemes.hedline_4,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CupertinoButton(
                                      child: Text(
                                        'How is my password kept secure?',
                                        style: TextThemes.hedline_11.copyWith(
                                            color: ColorPalette.c53c1fc),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
