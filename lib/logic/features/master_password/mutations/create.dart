import 'package:password_manager/logic/store/app_state.dart';
import 'package:velocity_x/velocity_x.dart';

import 'load_master_pass_status.dart';

class CreateMasterPass extends VxMutation<AppState>{
  CreateMasterPass(this.password);

  final String password;

  @override
  perform() async{
    await store?.setInitialPassword(password);
    print('created pass');
    next(() => LoadMasterPassStatus());
  }

}