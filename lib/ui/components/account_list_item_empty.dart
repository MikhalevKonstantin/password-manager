import 'package:flutter/material.dart';
import 'package:password_manager/ui/theme/text_theme.dart';

class AccountItemEmpty extends StatelessWidget {
  const AccountItemEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "You haven't added any accounts yet. "
            "\nAdd your personal accounts and "
            "\nmanage them in one place.",
        style: TextThemes.hedline_9,
      ),
      Image.asset(
        'assets/images/image.png',
      ),
      //
    ],);
  }
}
