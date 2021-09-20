import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';

class SearchField extends HookWidget {
  const SearchField({Key? key, this.onChanged}) : super(key: key);

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {

    final controller = useTextEditingController(text: '');

    controller.addListener((){
      onChanged?.call(controller.text);
    });


    return TextField(
      onChanged: onChanged,
      //cursorColor: ColorPalette.white,
      controller: controller,
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
    );
  }
}
