import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/components/account_list_item.dart';
import 'package:password_manager/ui/components/account_list_item_empty.dart';
import 'package:password_manager/ui/components/search_field.dart';
import 'package:password_manager/ui/screens/add_new_account/add_new_account.dart';
import 'package:password_manager/ui/screens/add_new_account/edit_account.dart';
import 'package:password_manager/ui/screens/add_new_account/view_account.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Passwords extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final accounts =
        useValueListenable(Hive.box<Account>('accounts').listenable());

    final boxFilter = useValueNotifier('');
    final filter = useValueListenable(boxFilter);

    final items = accounts.values
            .where((account) => account.name.contains(filter))
            .toList() ??
        [];

    return Scaffold(
      body: SafeArea(
        ///TODO A1 resize image(remove white space in the photo)
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: Text(
                  'Passwords',
                  style: TextThemes.hedline_6,
                ),
                subtitle: Text(
                  '${accounts.length} accounts',
                  style: TextThemes.hedline_9
                      .copyWith(color: ColorPalette.c3D3B3B),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AddNewAccount()),
                      );
                    },
                    child: SvgPicture.asset('assets/svg_icons/add new.svg')),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  children: [
                    SearchField(
                      onChanged: (str) {
                        boxFilter.value = str;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ValueListenableBuilder(
                      valueListenable: boxFilter,
                      builder: (ctx, str, widget) {
                        return items.length > 0
                            ? ListView.builder(
                                primary: true,
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (ctx, index) {
                                  return AccountItem(
                                    account: items[index],
                                    onTap: () {
                                      _modalBottomSheetMenu(ctx, items[index]);
                                    },
                                  );
                                })
                            : ListView(
                                shrinkWrap: true,
                                children: [
                                  AccountItemEmpty(),
                                ],
                              );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(ctx, Account account) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: ctx,
      builder: (context) {
        return new Container(
          height: 375.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: SingleChildScrollView(
              child: new Column(
                children: [
                  SizedBox(height: 20),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      _launchInBrowser(account.url);
                    },
                    visualDensity: VisualDensity.compact,
                    //contentPadding: EdgeInsets.all(-5),
                    dense: true,
                    title: Text(
                      'Open',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/export 1.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: account.username));
                      Navigator.of(context).pop();
                    },
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Copy username',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/user 2.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: account.password));
                      Navigator.of(context).pop();
                    },
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Copy password',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/lock.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (ctx) => ViewAccount(account: account)));
                    },
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'View',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/document.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (ctx) => EditAccount(account: account),
                        ),
                      );
                    },
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Edit',
                      style: TextThemes.hedline_12,
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/pen.svg'),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      print(Hive.box<Account>('accounts').delete(account.name));
                      Navigator.of(context).pop();
                    },
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(
                      'Delete',
                      style: TextThemes.hedline_12
                          .copyWith(color: ColorPalette.cF35748),
                    ),
                    leading: SvgPicture.asset('assets/svg_icons/delete 1.svg'),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
