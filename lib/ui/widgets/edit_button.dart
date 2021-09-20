import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/ui/theme/color_theme.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorPalette.c53c1fc,
      ),
      width: 45,
      height: 45,
      child: IconButton(
        icon: SvgPicture.asset(
            'assets/svg_icons/pen24.svg'),
        onPressed: onTap,
      ),
    );
  }
}
