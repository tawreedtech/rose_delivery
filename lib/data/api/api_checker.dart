
import 'package:get/get.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';
import 'package:rose_delivery/common/basewidgets/custom_snackbar_widget.dart';
import 'package:rose_delivery/features/auth/screens/login_screen.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      Get.find<SplashController>().removeSharedData();
      Get.to(() => const LoginScreen());
    }else {
      showCustomSnackBarWidget(response.statusText);
    }
  }
}