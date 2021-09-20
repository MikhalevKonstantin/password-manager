import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/logic/features/inapp/iap_initialized_state.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/logic/model/account_breach.dart';
import 'package:password_manager/logic/model/password_breach.dart';
import 'package:rxdart/subjects.dart';
import 'package:velocity_x/velocity_x.dart';

class AppState extends VxStore {
  static final MASTER_BOX = "mi_box_${DateTime.now().microsecond}";
  static const PASS_KEY = "my_password";
  static const SECURE_KEY = 'mi_encryption_key';
  final secureStorage = FlutterSecureStorage();

  IAPState iapState = IAPState(false);
  List<Account>? accounts;
  Box? masterPassBox;

  bool? masterPassExists;

  bool? faceIdAvailable;

  bool? fingerprintAvailable;

  bool? loggedIn;

  List<AccountBreach> accountBreaches = [];

  PasswordBreach passwordsBreached = PasswordBreach(false, 0, '');

  BehaviorSubject<List<Account>> get account$ =>
      BehaviorSubject<List<Account>>();

  Future subscribeToAccounts() async {
    final box = await Hive.openBox<Account>('accounts');
    box.listenable().addListener(() {
      print('accounts changed');
      account$.add(box.values.toList());
    });
  }

  Future<List<int>?> getSecureStorageKey() async {
    final secureStorage = FlutterSecureStorage();
    final existing = await secureStorage.read(
      key: SECURE_KEY,
    );

    dynamic secureKey;

    if (existing != null) {
      secureKey = base64Url.decode(existing);
    } else {
      secureKey = Hive.generateSecureKey();
      await secureStorage.write(
        key: SECURE_KEY,
        value: base64.encode(secureKey),
      );
      print('written');
    }

    final encoded = await secureStorage.read(
      key: SECURE_KEY,
    );
    secureKey = base64Url.decode(encoded!);

    return secureKey;
  }

  setInitialPassword(String pass) async {
    final secureKey = await getSecureStorageKey();

    final masterPassBox = await Hive.openBox<String>(
      MASTER_BOX,
      encryptionCipher: HiveAesCipher(secureKey!),
    );

    await masterPassBox.put(PASS_KEY, pass);
  }

  Future<bool> isPasswordSet() async {
    final secureStorage = FlutterSecureStorage();
    final encoded = await secureStorage.read(
      key: SECURE_KEY,
    );

    if (encoded == null) {
      print('encoded=nul');
      return false;
    }

    final secureKey = base64Url.decode(encoded);

    final masterPassBox = await Hive.openBox<String>(
      MASTER_BOX,
      encryptionCipher: HiveAesCipher(secureKey),
    );

    final String? password =
        await masterPassBox.get(PASS_KEY, defaultValue: '');

    return (password?.length ?? 0) > 0;
    //
    // if(pass.compareTo(password) == 0){
    //   print('correct');
    // }
  }

  Future<bool> checkPassword(String pass) async {
    // read key from secure storage

    // decode key from json
    final secureKey = await getSecureStorageKey();

    // creates/opens encrypted box
    final masterPassBox = await Hive.openBox<String>(
      MASTER_BOX,
      encryptionCipher: HiveAesCipher(secureKey!),
    );

    // get password from Hive
    final password = await masterPassBox.get(
      PASS_KEY,
    );

    if (pass.compareTo(password ?? 'err') == 0) {
      print('correct');
      return true;
    }

    return false;
  }
}
