import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';
import 'package:password_manager/ui/widgets/account_view_text_tile.dart';

class AccountView extends HookWidget {
  const AccountView({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    final hidePass = useState(true);
    var _hidePass = hidePass.value;
    final _passwordController = useTextEditingController(
      text: account.password,
    );

    return Container(
      child: ListView(
        // padding: EdgeInsets.only(top:20, bottom: 20),

        shrinkWrap: true,
        primary: false,
        children: [
          AccountViewTextTile(
            text: account.name,
            title: 'Name',
          ),

          AccountViewTextTile(
            text: account.url,
            title: 'URL',
          ),

          AccountViewTextTile(
            text: account.username,
            title: 'Username',
          ),

          SizedBox(height:20),
          // SizedBox
          Container(
            height: 60,
            width: 100,
            child: ListTile(
              title: Text(
                "Password",
                style:
                    TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              subtitle: TextField(
                style: TextStyle(color: ColorPalette.c3A3943),
                cursorColor: ColorPalette.c53c1fc,
                controller: _passwordController,
                obscureText: _hidePass,
                // enabled: true,
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.white),
                  ),

                  labelStyle: TextThemes.hedline_2,

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
                      // setState(() {
                      hidePass.value = !_hidePass;
                      // });
                    },
                  ),
                ),
              ),
            ),
          ),
          AccountViewTextTile(
            text: account.notes,
            title: 'Notes',
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
    );
  }
}
