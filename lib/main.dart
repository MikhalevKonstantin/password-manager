
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/logic/model/account.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/ui/screens/splash/splash.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  // await Hive.initFlutter();
  await Hive.deleteFromDisk();

  await Hive.initFlutter();
  await FlutterSecureStorage().deleteAll();
  Hive.registerAdapter(AccountAdapter());
  await Hive.openBox<Account>('accounts');

  runApp(VxState(store: AppState(), child: MyApp()));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}
