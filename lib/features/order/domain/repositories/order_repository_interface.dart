
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rose_delivery/interface/repository_interface.dart';

abstract class OrderRepositoryInterface implements RepositoryInterface{
  Future<Response> getCurrentOrders();
  Future<Response> getAllOrderHistory(String type, String startDate, String endDate, String search, int isPause);
}