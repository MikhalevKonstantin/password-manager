import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/logic/features/pwnz/check_password_pwnz.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/ui/screens/add_new_account/base_page.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ResultPassword extends HookWidget {
  const ResultPassword({Key? key, required this.password}) : super(key: key);

  final String password;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        print('using password effect');
        ClearPassword();
        CheckPasswordPwnz(password);

        // return () => ClearPassword();
      },
      [password],
    );

    VxState.watch(context, on: [CheckPasswordPwnz]);

    final  breachedPass =
        (VxState.store as AppState).passwordsBreached;



    final String pass = breachedPass.hashSuffix;
    final int found = breachedPass.breachesCount;

    return BasePage(
      title: 'Results',
      child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password (hash prefix):',
              style: TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(20)),
              height: 54,
              width: MediaQuery.of(context).size.width - 40,
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pass ?? '',
                      style: TextThemes.hedline_10
                          .copyWith(color: ColorPalette.c3A3943),
                    ),
                    SvgPicture.asset('assets/svg_icons/warning.svg'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Text.rich(
              TextSpan(
                text: 'Found ',
                style:
                    TextThemes.hedline_2.copyWith(color: ColorPalette.c3A3943),
                children: <TextSpan>[
                  TextSpan(
                      text: '$found',
                      style: TextThemes.hedline_15
                          .copyWith(color: ColorPalette.cFF0000)),
                  TextSpan(
                      text: ' times!',
                      style: TextThemes.hedline_2
                          .copyWith(color: ColorPalette.c3A3943)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Please ensure that you change this password'
              '\nanywhere you are using it.'
              '\n'
              '\nWe highly recommend using a strong, unique'
              '\npassword for each site/account.',
              style: TextThemes.hedline_2.copyWith(color: ColorPalette.c3A3943),
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
