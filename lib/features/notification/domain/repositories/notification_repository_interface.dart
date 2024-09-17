

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rose_delivery/interface/repository_interface.dart';

abstract class NotificationRepositoryInterface implements RepositoryInterface {
  Future<Response> getNotificationList(int offset);
  void saveSeenNotificationCount(int count);
  int? getSeenNotificationCount();
}