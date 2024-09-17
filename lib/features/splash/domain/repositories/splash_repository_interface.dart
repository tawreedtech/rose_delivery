

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rose_delivery/interface/repository_interface.dart';

abstract class SplashRepositoryInterface implements RepositoryInterface{
  Future<Response> getConfigData();
  Future<bool> initSharedData();
  String getCurrency();
  void setCurrency(String currencyCode);
  Future<bool> removeSharedData();
  void disableIntro();
  bool? showIntro();
  void disableNotification();
  void enableNotification();
  bool? notificationSound();
}