import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    ConnectivityResult _result = await checkConnectivity2();
    return _result != ConnectivityResult.none;
  }
static Future<ConnectivityResult> checkConnectivity2()async{

   ConnectivityResult? result;
 Connectivity().onConnectivityChanged.listen(( conntection) {
      

result= conntection.first;
    



 });
 return result!;
}
  static void checkConnectivity(BuildContext context) {
    Connectivity().onConnectivityChanged.listen(( result) {

      if(Get.find<SplashController>().firstTimeConnectionCheck) {
        Get.find<SplashController>().setFirstTimeConnectionCheck(false);
      }else {

        late   bool isNotConnected ;

for (var conntection in result) {
           isNotConnected = 
          
          conntection == ConnectivityResult.mobile
          
           || 
            conntection == ConnectivityResult.wifi
            

          ;

}








        isNotConnected ? const SizedBox() :
        
         ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(isNotConnected ? 'no_connection' : 'connected',
            textAlign: TextAlign.center,
          ),
        ));
      }
    });
  }
}
