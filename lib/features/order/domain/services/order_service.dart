import 'package:get/get.dart';
import 'package:rose_delivery/data/api/api_checker.dart';
import 'package:rose_delivery/features/order/domain/models/order_model.dart';
import 'package:rose_delivery/features/order/domain/repositories/order_repository_interface.dart';
import 'package:rose_delivery/features/order/domain/services/order_service_interface.dart';

class OrderService implements OrderServiceInterface{
  OrderRepositoryInterface orderRepoInterface;
  OrderService({required this.orderRepoInterface});

  @override
  Future getCurrentOrders() async{
    Response response = await orderRepoInterface.getCurrentOrders();
    List<OrderModel> _currentOrders = [];
    if (response.body != null && response.body != {} && response.statusCode == 200) {
      _currentOrders = [];
      response.body.forEach((order) {_currentOrders.add(OrderModel.fromJson(order));});
    } else {
      ApiChecker.checkApi(response);
    }
    return _currentOrders;
  }
  @override
  Future<Response> getAllOrderHistory(String type, String startDate, String endDate, String search, int isPause) {
    return orderRepoInterface.getAllOrderHistory(type, startDate, endDate, search, isPause);
  }
}