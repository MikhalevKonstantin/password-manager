import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/ui/components/account_form.dart';
import 'package:password_manager/ui/screens/add_new_account/base_page.dart';

class AddNewAccount extends HookWidget {
  const AddNewAccount({Key? key, this.password}) : super(key: key);
  final String? password;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Add new account',
      child: AccountForm(
        account: password?.isNotEmpty ?? false
            ? Account.of(password: password!)
            : Account.empty(),
      ),
    );
  }
}
