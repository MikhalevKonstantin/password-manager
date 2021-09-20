import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:password_manager/logic/features/inapp/iap_initialized_state.dart';
import 'package:password_manager/logic/store/app_state.dart';
import 'package:velocity_x/velocity_x.dart';

class SubscriptionButton extends StatelessWidget {
  const SubscriptionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final iapState =

    // if iapState.state && firebase
    return TripleBuilder<IAPState, Exception, bool>(
      store: (VxState.store as AppState).iapState,
      builder: (c, t) {
        final ready = !t.isLoading && t.state;

        return CupertinoButton.filled(
          child: Text('64'),
          onPressed: (){

          },
        );
      },
    );
  }
}
