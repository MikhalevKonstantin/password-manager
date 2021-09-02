import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/theme/color_theme.dart';
import 'package:password_manager/theme/text_theme.dart';

class GeneratePassword extends StatefulWidget {
  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  bool _value = false;
  double val = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Generate Password',
                style: TextThemes.hedline_6,
              ),
              SizedBox(height: 30),
              Text('Generated Password',
                  style: TextThemes.hedline_5
                      .copyWith(color: ColorPalette.c9FA2B2)),
              SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      decoration: BoxDecoration(

                          color: ColorPalette.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('     fbSNDCctQx34gCJny'))),
                  trailing:
                      SvgPicture.asset('assets/svg_icons/generate_password.svg'),
                ),
              ),
              Text('Length: ${val.toInt()}'),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('4'),
                    CupertinoSlider(
                        thumbColor: ColorPalette.c53c1fc,
                        activeColor: ColorPalette.c53c1fc,
                        //divisions: 28,
                        value: val,
                        min: 4.0,
                        max: 32.0,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        }),
                    Text('32')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
