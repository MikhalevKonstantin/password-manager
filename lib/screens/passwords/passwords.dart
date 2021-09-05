import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/screens/add_new_account/add_new_account.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class Passwords extends StatefulWidget {
  const Passwords({Key? key}) : super(key: key);

  @override
  _PasswordsState createState() => _PasswordsState();
}

class _PasswordsState extends State<Passwords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        ///TODO A1 resize image(remove white space in the photo)
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Passwords',
                      style: TextThemes.hedline_6,
                    ),
                    subtitle: Text(
                      '0 accounts',
                      style: TextThemes.hedline_9
                          .copyWith(color: ColorPalette.c3D3B3B),
                    ),
                    trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AddNewAccount()),
                          );
                        },
                        child:
                            SvgPicture.asset('assets/svg_icons/add new.svg')),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        TextField(
                          //cursorColor: ColorPalette.white,
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            fillColor: ColorPalette.cF3F4F8,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            //fillColor: ColorPalette.black_600,
                            filled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 18, top: 16, bottom: 16),
                            hintText: 'Search',
                            hintStyle: TextThemes.hedline_8,
                            prefixIcon: IconButton(
                              icon: SvgPicture.asset(
                                'assets/svg_icons/search.svg',
                                color: ColorPalette.cC6C5CA,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Text(
                          "You haven't added any accounts yet. "
                          "\nAdd your personal accounts and "
                          "\nmanage them in one place.",
                          style: TextThemes.hedline_9,
                        ),
                        Image.asset(
                          'assets/images/image.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //
              //
              // ListTile Passwords
              //
              //
              // GestureDetector(
              //   onTap: () {
              //     _modalBottomSheetMenu();
              //   },
              //   child: ListTile(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)),
              //     tileColor: ColorPalette.white,
              //     title: Text(
              //       'Amazone',
              //       style: TextThemes.hedline_10,
              //     ),
              //     subtitle: Text(
              //       'https://amazone.com',
              //       style: TextThemes.hedline_9,
              //     ),
              //     trailing: SvgPicture.asset('assets/svg_icons/action.svg'),
              //   ),
              // ),
              //
              //
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (builder) {
        return new Container(
          height: 375.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: SingleChildScrollView(
              child: new Column(
                children: [
                  SizedBox(height: 20),
                  const Divider(),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    //contentPadding: EdgeInsets.all(-5),
                    dense: true,
                    title: Text(
                      'Open',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/export 1.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Copy username',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/user 2.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Copy password',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/lock.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Copy password',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/document.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Edit',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/pen.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Delete',
                      style: TextThemes.hedline_12
                          .copyWith(color: ColorPalette.cF35748),
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/delete 1.svg'),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
