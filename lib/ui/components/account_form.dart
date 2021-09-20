import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/screens/add_new_account/view_account.dart';
import 'package:password_manager/ui/theme/color_theme.dart';
import 'package:password_manager/ui/theme/text_theme.dart';

class AccountForm extends HookWidget {
  final Account account;

  AccountForm({Key? key, required this.account}) : super(key: key);
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: account.name);
    final urlController = useTextEditingController(text: account.url);
    final usernameController = useTextEditingController(text: account.username);
    final passController = useTextEditingController(text: account.password);
    final notesController = useTextEditingController(text: account.notes);

    final hidePass = useState(true);
    bool _hidePass = hidePass.value;

    final minPadding = 9.0;

    const listviewPadding =  const EdgeInsets.only(
      left: 16, right: 16, top: 4, bottom: 20,);
    return Form(
      key: formKey,
      child: Container(
        child: ListView(
          // padding: EdgeInsets.only(top:20, bottom: 20),

          shrinkWrap: true,
          primary: false,

          children: [
            ListTile(
             contentPadding: listviewPadding,
              title: Text(
                'Name',
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              subtitle: TextFormField(
                controller: nameController,
                style:
                TextThemes.hedline_2.copyWith(color: ColorPalette.c3A3943),
              ),
              // horizontalTitleGap: 20,
              // contentPadding: EdgeInsets.only(bottom: 0),
            ),
            ListTile(
             contentPadding: listviewPadding,
              title: Text(
                'URL',
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              subtitle: TextFormField(
                controller: urlController,
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),
              ),
            ),
            ListTile(
             contentPadding: listviewPadding,
              title: Text(
                'Username',
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              subtitle: TextFormField(
                controller: usernameController,
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),
              ),
            ),
            ListTile(
             contentPadding: listviewPadding,
              title: Text(
                'Password',
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              subtitle: TextFormField(
                controller: passController,
                style: TextStyle(color: ColorPalette.c3A3943),
                cursorColor: ColorPalette.c53c1fc,
                //controller: _passwordController,
                obscureText: _hidePass,
                decoration: InputDecoration(
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: ColorPalette.white),
                  // ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: ColorPalette.white),
                  // ),

                  // labelStyle: TextThemes.hedline_2,

                  //hintText: 'Password',
                  hintStyle: TextThemes.hedline_5
                      .copyWith(color: ColorPalette.c9FA2B2),
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  suffixIcon: IconButton(
                    icon: _hidePass
                        ? SvgPicture.asset(
                      'assets/svg_icons/eyecl.svg',
                      color: ColorPalette.c3A3943,
                    )
                        : SvgPicture.asset(
                      'assets/svg_icons/eye.svg',
                      color: ColorPalette.c3A3943,
                    ),
                    onPressed: () {
                      hidePass.value = !_hidePass;
                    },
                  ),
                ),
              ),
            ),
            ListTile(
             contentPadding: listviewPadding,
              title: Text(
                'Notes',
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c9FA2B2),
              ),
              subtitle: TextFormField(
                controller: notesController,
                style:
                TextThemes.hedline_5.copyWith(color: ColorPalette.c3A3943),
              ),
            ),
            //
            //
            // Button Save

            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 40,
              child: CupertinoButton(
                alignment: Alignment.bottomCenter,
                borderRadius: BorderRadius.circular(20),
                onPressed: () async {
                  formKey.currentState!.save();

                  final name = nameController.text;
                  final url = urlController.text;
                  final username = usernameController.text;
                  final pass = passController.text;
                  final notes = notesController.text;

                  final box = await Hive.openBox<Account>('accounts');

                  final acct = Account(
                    name: name,
                    url: url,
                    username: username,
                    password: pass,
                    notes: notes,
                  );

                  if(account.name!=null){
                    if(account.name == acct.name){
                     // ok
                    } else {
                      await box.delete(account.name);

                    }
                  }
                  await box.put(name, acct);


                  print('saved');

                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              ViewAccount(
                                account: acct,
                              )));
                },
                color: ColorPalette.c53c1fc,
                child: Text(
                  'Save',
                  style:
                  TextThemes.hedline_4.copyWith(color: ColorPalette.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
