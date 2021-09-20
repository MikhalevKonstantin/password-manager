import 'package:local_auth/local_auth.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthenticateBiometric extends VxMutation<AppState> {
  @override
  perform() async {
    var localAuth = LocalAuthentication();
    var isAuthenticated = await localAuth.authenticate(
      biometricOnly: true,
      localizedReason: 'Please authenticate to login',
    );

    store?.loggedIn = isAuthenticated;
    print('did authenticate $isAuthenticated');
  }
}
