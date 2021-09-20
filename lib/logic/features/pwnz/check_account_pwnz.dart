import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/logic/model/account_breach.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckAccountPwnz extends VxMutation<AppState> {
  CheckAccountPwnz(this.username);

  final String username;

  Dio dio = Dio();

  @override
  perform() async {
    final encodedName = Uri.encodeComponent(username);
    print(encodedName);
    final response = await dio.get(
      'https://haveibeenpwned.com/api/v3/breachedaccount/$encodedName?truncateResponse=false',
      options: Options(
        headers: {
          'hibp-api-key': 'f92f3b40eac24c7ea4009cf0c9e7eb6d',
        },
      ),
    );


    if(response.statusCode == 200){
      store?.accountBreaches =
          response.data.map<AccountBreach>((value) => AccountBreach.fromJson(value))
              .toList();
    }

    else {
      store?.accountBreaches = [];
    }



    // next(() => LoadMasterPassStatus());
  }
}
