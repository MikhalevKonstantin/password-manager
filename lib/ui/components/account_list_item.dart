import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';

class AccountItem extends HookWidget {
  const AccountItem({
    Key? key,
    required this.account,
    required this.onTap,
  }) : super(key: key);

  final Account account;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: ColorPalette.white,
        title: Text(
          account.name,
          style: TextThemes.hedline_10,
        ),
        subtitle: Text(
          account.url,
          style: TextThemes.hedline_9,
        ),
        trailing: SvgPicture.asset('assets/svg_icons/action.svg'),
      ),
    );
  }
}
