import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.white,
        leadingWidth: 45,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
            child: SvgPicture.asset('assets/svg_icons/back.svg')),
      ),
      body: Column(
        children: [
          Text('hi')
        ],
      ),
    );
  }
}
