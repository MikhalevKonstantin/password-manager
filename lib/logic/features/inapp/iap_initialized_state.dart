import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class IAPState extends NotifierStore<Exception, bool> {
  IAPState(bool initialState) : super(initialState) {
    init();
  }

  init() async {
    setLoading(true);

    try {
      await FlutterInappPurchase.instance.initConnection;
    } on Exception catch(e){
      print(e);
      setError(e);
    } catch(e){
      print(e);
      setError(Exception('unknown error'));
    } finally{
      setLoading(false);
    }
    update(true);
  }
}
