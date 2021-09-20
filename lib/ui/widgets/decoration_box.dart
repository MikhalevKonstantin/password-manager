
import 'package:flutter/cupertino.dart';

decorationBox() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff1782ff),
        Color(0xff53c1fc),
      ],
    ),
  );
}