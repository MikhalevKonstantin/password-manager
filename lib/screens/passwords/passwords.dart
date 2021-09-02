import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      // appBar: AppBar(
      //   backgroundColor: ColorPalette.white,
      //   elevation: 0,
      //   titleSpacing: MediaQuery.of(context).size.width,
      // ),
      body: SafeArea(
        ///TODO A1 resize image(remove white space in the photo)
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Passwords',
                  style: TextThemes.hedline_6,
                ),
                subtitle: Text(
                  '0 accounts',
                  style:
                      TextThemes.hedline_9.copyWith(color: ColorPalette.c3D3B3B),
                ),
                trailing: SvgPicture.asset('assets/svg_icons/add new.svg'),
              ),
              TextField(
                //cursorColor: ColorPalette.white,
                controller: TextEditingController(),
                focusNode: FocusNode(),
                decoration: InputDecoration(
                  fillColor: ColorPalette.cF3F4F8,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  //fillColor: ColorPalette.black_600,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 18, top: 16, bottom: 16),
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
              Image.asset('assets/images/image.png',),
              // ListTile(
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //   tileColor: ColorPalette.white,
              //   title: Text('Amazone', style: TextThemes.hedline_10,),
              //   subtitle: Text('https://amazone.com', style: TextThemes.hedline_9,),
              //   trailing: SvgPicture.asset('assets/svg_icons/action.svg'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


