import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/components/account_view.dart';
import 'package:password_manager/ui/screens/add_new_account/base_page.dart';
import 'package:password_manager/ui/widgets/edit_button.dart';

import 'edit_account.dart';

class ViewAccount extends StatelessWidget {
  const ViewAccount({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: account.name,
      child: AccountView(account: account),
      trailing: EditButton(onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => EditAccount(account: account),
          ),
        );
      }),
    );
  }
}
