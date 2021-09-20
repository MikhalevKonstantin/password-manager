import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/logic/model/password_breach.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckPasswordPwnz extends VxMutation<AppState> {
  CheckPasswordPwnz(this.password);

  final String password;

  Dio dio = Dio();

  @override
  perform() async {
    print(password);
    final bytes = utf8.encode(password);
    final digest = sha1.convert(bytes);
    final hash = digest.toString();

    print(hash.toUpperCase());

    print("Digest as hex string: $hash");

    final hashPrefix = hash.substring(0, 5);

    print(hashPrefix);
    final suffixHash = hash.substring(5, hash.length - 1).toUpperCase();

    final response = await dio.get(
      'https://api.pwnedpasswords.com/range/$hashPrefix',
      options: Options(
        headers: {
          'hibp-api-key': 'f92f3b40eac24c7ea4009cf0c9e7eb6d',
        },
      ),
    );

    final List<String> lines = response.data.toString().split('\r\n');

    print("lines: ${lines.length}");
    final matches = lines
        .filter((value) => value.startsWith(suffixHash))
        .map((s) => s.split(':'))
        .filter((parts) => int.parse(parts[1]) > 0)
        .toList();

    if (matches.isNotEmpty && matches.first.isNotEmpty) {
      final count = int.parse(matches.first[1]);

      store?.passwordsBreached = PasswordBreach(true, count, hashPrefix);
    } else {
      store?.passwordsBreached = PasswordBreach(false, 0, hashPrefix);
    }

    // next(() => LoadMasterPassStatus());
  }
}

class ClearPassword extends VxMutation<AppState> {
  @override
  perform() {
    // TODO: implement perform
    store?.passwordsBreached = PasswordBreach.empty();
  }
}
