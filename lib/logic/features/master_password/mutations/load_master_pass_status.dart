import 'package:password_manager/logic/store/app_state.dart';
import 'package:password_manager/main.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadMasterPassStatus extends VxMutation<AppState> {


  @override
  perform() async {
   final isSet = await store?.isPasswordSet();
   print('is set: $isSet');
   store?.masterPassExists = isSet;
  }
}
