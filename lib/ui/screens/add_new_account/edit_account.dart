import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/components/account_form.dart';
import 'package:password_manager/ui/screens/add_new_account/base_page.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Edit ${account.name}',
      child: AccountForm(account: account),
    );
  }
}
