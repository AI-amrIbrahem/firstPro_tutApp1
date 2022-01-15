
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo{
 Connectivity _connectivity;

 NetworkInfo(this._connectivity);

 Future<bool> isConnected()  async{
  ConnectivityResult result =  await _connectivity.checkConnectivity();

  if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
   return true;
  } else{
   return false;
  }

 }
}