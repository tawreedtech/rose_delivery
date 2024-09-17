import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/order/controllers/order_controller.dart';
import 'package:rose_delivery/features/wallet/controllers/wallet_controller.dart';
import 'package:rose_delivery/features/order/domain/models/order_model.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_delivery/common/basewidgets/custom_loader_widget.dart';
import 'package:rose_delivery/common/basewidgets/no_data_screen_widget.dart';
import 'package:rose_delivery/features/order/widgets/order_history_header_widget.dart';
import 'package:rose_delivery/features/order/widgets/order_history_item_widget.dart';


class OrderHistoryScreen extends StatefulWidget {
  final bool fromMenu;
  const OrderHistoryScreen({Key? key, this.fromMenu = false}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    if(widget.fromMenu){
      Get.find<OrderController>().setOrderTypeIndex(0);
      Get.find<OrderController>().setOrderTypeIndex(0, startDate: '',endDate:  '');
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(title: 'order_history'.tr),

        body: RefreshIndicator(onRefresh: () async{
          Get.find<OrderController>().searchOrderController.clear();
          Get.find<OrderController>().setOrderTypeIndex(Get.find<OrderController>().orderTypeIndex,
              startDate: Get.find<WalletController>().startDate == "dd-mm-yyyy"? "" :Get.find<WalletController>().startDate,
              endDate:  Get.find<WalletController>().endDate =="dd-mm-yyyy"? "" :Get.find<WalletController>().endDate);
        },
        child: CustomScrollView( slivers: [

            SliverToBoxAdapter(child: Column(children: [
              const OrderHistoryHeaderWidget(),
              Container(transform: Matrix4.translationValues(0.0, -00.0, 0.0),
                child: GetBuilder<OrderController>(builder: (orderController) {

                  List<OrderModel> orders = [];
                  if(orderController.orderTypeIndex == 2){
                    orders = orderController.pauseOrderHistory;
                  }else if(orderController.orderTypeIndex == 3){
                    orders = orderController.deliveredOrderHistory;
                  }else{
                    orders = orderController.allOrderHistory;
                  }

                  return !orderController.isLoading ? orders.isNotEmpty ?
                  ListView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orders.length,
                      padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
                      itemBuilder: (context, index){
                        return OrderHistoryItemWidget(orderModel: orders[index]);
                      })   :
                   Padding(padding: EdgeInsets.only(top: Dimensions.paddingSizeOverLarge),
                    child: const NoDataScreenWidget(),) :const CustomLoaderWidget(height: 500,);
                }
                ),
              )
            ],),)
          ],
        )));
  }
}
