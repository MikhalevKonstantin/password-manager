import 'package:flutter/material.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';
import 'package:password_manager/ui/widgets/back_arrow_button.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key, this.child, this.title: '', this.leading, this.trailing}) : super(key: key);

  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 235,
              child: Image.asset(
                'assets/images/Backgroundtop.png',
                //fit: BoxFit.cover,
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: Cross,
                          children: [
                            leading ?? BackArrowButton(),
                            Text(
                             title,
                              style: TextThemes.hedline_11,
                            ),
                            trailing ?? SizedBox(width: 45,),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 4, vertical: 40),
                        decoration: BoxDecoration(
                          color: ColorPalette.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0),
                          ),
                        ),
                        child: child,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
