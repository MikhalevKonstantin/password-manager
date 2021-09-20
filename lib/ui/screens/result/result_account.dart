import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/logic/features/pwnz/check_account_pwnz.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/logic/model/account_breach.dart';
import 'package:password_manager/ui/screens/add_new_account/base_page.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ResultAccount extends HookWidget {
  const ResultAccount(this.username, {Key? key}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      print('effect on');
      print(username);
      CheckAccountPwnz(username);
    }, [username]);

    VxState.watch(context, on: [CheckAccountPwnz]);
    final breachedAccounts = (VxState.store as AppState).accountBreaches;
    print(breachedAccounts);

    return BasePage(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account identifier:',
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
                      username,
                      style: TextThemes.hedline_10
                          .copyWith(color: ColorPalette.c3A3943),
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Text.rich(
              TextSpan(
                text: 'Found in ',
                style: TextThemes.hedline_2.copyWith(color: ColorPalette.c3A3943),
                children: <TextSpan>[
                  TextSpan(
                      text: '${breachedAccounts.length} ',
                      style: TextThemes.hedline_15
                          .copyWith(color: ColorPalette.c53c1fc)),
                  TextSpan(
                      text: 'breaches:',
                      style: TextThemes.hedline_2
                          .copyWith(color: ColorPalette.c3A3943)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 17),
            ListView.builder(
              itemCount: breachedAccounts.length,
              shrinkWrap: true,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                final breach = breachedAccounts[index];

                print('breach: ' + breach.name);
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) {
                      return BreachInfoView(
                        breach: breach,
                      );
                    }));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: ColorPalette.white,
                  title: Text(
                    breach.name,
                    style: TextThemes.hedline_10,
                  ),
                  subtitle: Text(
                    breach.addedDate,
                    style: TextThemes.hedline_9
                        .copyWith(color: ColorPalette.c616E7C),
                  ),
                  trailing: SvgPicture.asset('assets/svg_icons/Button.svg'),
                  leading: Container(
                    //
                    // padding: EdgeInsets.symmetric(vertical:8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue[100],
                      // shape: RoundedRectangleBorder(borderRadius: ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        breach.logoPath,
                        width: 48,
                        height: 64,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                );
              },
            ),
            //
            // SizedBox(height: 20),
            // ListTile(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)),
            //   tileColor: ColorPalette.white,
            //   title: Text(
            //     'Apple',
            //     style: TextThemes.hedline_10,
            //   ),
            //   subtitle: Text(
            //     '4 Dec, 2019 at 03:00 AM ',
            //     style: TextThemes.hedline_9
            //         .copyWith(color: ColorPalette.c616E7C),
            //   ),
            //   trailing:
            //       SvgPicture.asset('assets/svg_icons/Button.svg'),
            //   leading: Image.asset('assets/images/image 24.png'),
            // ),
          ],
        ),
      ),
    );
  }
}

class BreachInfoView extends StatelessWidget {
  const BreachInfoView({
    Key? key,
    required this.breach,
  }) : super(key: key);
  final AccountBreach breach;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: breach.title,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              breach.name,
              style: TextThemes.hedline_1.copyWith(color: Colors.black),
            )),
            SizedBox(height: 8),
            Center(
                child: Text(
              breach.domain,
              style: TextThemes.hedline_0.copyWith(color: Colors.black),
            )),
            SizedBox(height: 20),
            Text('Added at: ' + breach.addedDate,
                style: TextThemes.hedline_3.copyWith(color: Colors.black)),
            Text('Leaked at: ' + breach.breachDate,
                style: TextThemes.hedline_3.copyWith(color: Colors.black)),
            SizedBox(height: 8),
            Text('Pwn Count: ${breach.pwnCount}',
                style: TextThemes.hedline_2.copyWith(color: Colors.black)),
            SizedBox(height: 8),
            Html(
              data: breach.description,
            ),
            SizedBox(height: 8),
            Text('Is Fabricated: ${breach.isFabricated}',
                style: TextThemes.hedline_2.copyWith(color: Colors.black)),
            Text('Verified: ${breach.isVerified}',
                style: TextThemes.hedline_2.copyWith(color: Colors.black)),
            Text('Retired: ${breach.isRetired}',
                style: TextThemes.hedline_2.copyWith(color: Colors.black)),
            Text('Fabricated: ${breach.isFabricated}',
                style: TextThemes.hedline_2.copyWith(color: Colors.black)),
            Text('Spam List: ${breach.isSpamList}',
                style: TextThemes.hedline_2.copyWith(color: Colors.black)),
            SizedBox(height: 20),
            Text("What's leaked: ${breach.dataClasses.join(', ')}",
                style: TextThemes.hedline_4.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
