import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class AddNewAccount extends StatefulWidget {
  const AddNewAccount({Key? key}) : super(key: key);

  @override
  State<AddNewAccount> createState() => _AddNewAccountState();
}

class _AddNewAccountState extends State<AddNewAccount> {
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
      backgroundColor: ColorPalette.white,
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
                            'Facebook',
                            style: TextThemes.hedline_11,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorPalette.c53c1fc,
                            ),
                            width: 45,
                            height: 45,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/svg_icons/pen24.svg'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Container(
                        //padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: ColorPalette.white,
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
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Name',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c9FA2B2),
                            ),
                            subtitle: Text(
                              'Facebook',
                              style: TextThemes.hedline_2
                                  .copyWith(color: ColorPalette.c3A3943),
                            ),
                            //horizontalTitleGap: 20,
                            //contentPadding: EdgeInsets.all(8),
                          ),
                          ListTile(
                            title: Text(
                              'URL',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c9FA2B2),
                            ),
                            subtitle: Text(
                              'https://www.facebook.com/',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c3A3943),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Username',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c9FA2B2),
                            ),
                            subtitle: Text(
                              'nik_87@tut.by',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c3A3943),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: TextField(
                              style: TextStyle(color: ColorPalette.c3A3943),
                              cursorColor: ColorPalette.c53c1fc,
                              //controller: _passwordController,
                              obscureText: _hidePass,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorPalette.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorPalette.white),
                                ),

                                // labelStyle: TextThemes.hedline_2,
                                labelText: 'Password',
                                labelStyle: TextThemes.hedline_5
                                    .copyWith(color: ColorPalette.c9FA2B2),
                                //hintText: 'Password',
                                hintStyle: TextThemes.hedline_5
                                    .copyWith(color: ColorPalette.c9FA2B2),
                                suffixIcon: IconButton(
                                  icon: _hidePass
                                      ? SvgPicture.asset(
                                          'assets/svg_icons/eyecl.svg',
                                          color: ColorPalette.c3A3943,
                                        )
                                      : SvgPicture.asset(
                                          'assets/svg_icons/eye.svg',
                                          color: ColorPalette.c3A3943,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      _hidePass = !_hidePass;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Notes',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c9FA2B2),
                            ),
                            subtitle: Text(
                              'Some notes',
                              style: TextThemes.hedline_5
                                  .copyWith(color: ColorPalette.c3A3943),
                            ),
                          ),
                          //
                          //
                          // Button Save
                          //
                          //
                          // Container(
                          //   width: MediaQuery.of(context).size.width - 40,
                          //   child: CupertinoButton(
                          //     alignment: Alignment.bottomCenter,
                          //     borderRadius: BorderRadius.circular(20),
                          //     onPressed: () {},
                          //     color: ColorPalette.c53c1fc,
                          //     child: Text(
                          //       'Save',
                          //       style: TextThemes.hedline_4
                          //           .copyWith(color: ColorPalette.white),
                          //     ),
                          //   ),
                          // ),
                          //
                          //
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
