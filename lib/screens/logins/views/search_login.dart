import 'package:flutter/material.dart';

class SearchLogin extends StatelessWidget {
  const SearchLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      focusNode: FocusNode(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        //fillColor: ColorPalette.black_600,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        hintText: 'Search login',
        hintStyle: Theme.of(context).textTheme.bodyText1,
        prefixIcon: IconButton(
          icon: Icon(Icons.search_rounded), onPressed: () {  },
        ),
      ),
    );
  }
}
