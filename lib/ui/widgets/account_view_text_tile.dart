import 'package:flutter/material.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';

class AccountViewTextTile extends StatelessWidget {
  const AccountViewTextTile({
    Key? key,
    required this.text,
    required this.title,

  }) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      child: ListTile(
        title: Text(
          title,

          style: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
        ),
        subtitle: Text(
          text,
          style: TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),
        ),
      ),
    );
  }
}
