import 'package:get/get.dart';
import 'package:rose_delivery/common/basewidgets/custom_snackbar_widget.dart';
import 'package:rose_delivery/data/api/api_checker.dart';
import 'package:rose_delivery/features/auth/domain/models/response_model.dart';
import 'package:rose_delivery/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:rose_delivery/features/auth/domain/services/auth_service_interface.dart';

class AuthService implements AuthServiceInterface {
  AuthRepositoryInterface authRepoInterface;
  AuthService({required this.authRepoInterface});

  @override
  Future<bool> clearSharedData() {
    return authRepoInterface.clearSharedData();
  }

  @override
  Future<bool> clearUserCredentials() {
    return authRepoInterface.clearUserCredentials();
  }

  @override
  String getUserEmail() {
    return authRepoInterface.getUserEmail();
  }

  @override
  String getUserPassword() {
    return authRepoInterface.getUserPassword();
  }

  @override
  String getUserToken() {
    return authRepoInterface.getUserToken();
  }

  @override
  bool isLoggedIn() {
    return authRepoInterface.isLoggedIn();
  }

  @override
  Future<ResponseModel> login(String countryCode, String phone, String password) async {
    Response response = await authRepoInterface.login(countryCode, phone, password);
    print("==Yo!==>>${response.statusCode}");
    if (response.statusCode == 200) {
      authRepoInterface.saveUserToken(response.body['token']);
      await authRepoInterface.updateToken();
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, response.statusText);
    }
  }

  @override
  void saveUserCredentials(String number, String password) {
    return authRepoInterface.saveUserCredentials(number, password);
  }

  @override
  void saveUserToken(String token) {
    return authRepoInterface.saveUserToken(token);
  }

  @override
  Future setLanguageCode(String currentLanguage) {
    return authRepoInterface.setLanguageCode(currentLanguage);
  }


  @override
  Future updateToken() {
    return authRepoInterface.updateToken();
  }

  @override
  Future<Response> forgotPassword(String? countryCode, String? phone) async{
    Response _response = await authRepoInterface.forgotPassword(countryCode, phone);
    if (_response.statusCode == 200) {
      showCustomSnackBarWidget('otp_send_successfully'.tr, isError: false);
    } else {
      ApiChecker.checkApi(_response);
    }
    return _response;
  }

  @override
  Future<Response> verifyOtp(String countryCode, String? phone) async{
    Response _response = await authRepoInterface.verifyOtp(countryCode, phone);
    if (_response.statusCode == 200) {

      showCustomSnackBarWidget('otp_verified_successfully'.tr, isError: false);
    } else {
      ApiChecker.checkApi(_response);
    }
    return _response ;
  }


}