// status available
// facelogin mutation

import 'dart:io';

import 'package:local_auth/local_auth.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateBiometricStatus extends VxMutation<AppState> {
  @override
  perform() async {
    final auth = LocalAuthentication();
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      // Face ID.
      store?.faceIdAvailable = availableBiometrics.contains(BiometricType.face);
      // Touch ID.
      store?.fingerprintAvailable =
          availableBiometrics.contains(BiometricType.fingerprint);

      print('store.faceIdAvailable = ${store?.faceIdAvailable}');
      print('store.fingerprintAvailable = ${store?.fingerprintAvailable}');

    }
  }
}
