import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/live_tracking/controllers/rider_controller.dart';
import 'package:rose_delivery/features/order/domain/models/order_model.dart';
import 'package:rose_delivery/features/order_details/widgets/order_info_with_customer_widget.dart';
import 'package:rose_delivery/utill/dimensions.dart';

class RiderBottomSheetWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const RiderBottomSheetWidget({Key? key, this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiderController>(
      builder: (riderController) {
        return Center(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(decoration: BoxDecoration(color: Theme.of(context).cardColor,
                  borderRadius :  BorderRadius.only(topLeft: Radius.circular(Dimensions.paddingSizeOverLarge),
                      topRight : Radius.circular(Dimensions.paddingSizeOverLarge)),
                  boxShadow: [BoxShadow(color: Get.isDarkMode ?
                  Colors.grey[900]! :Colors.grey[300]!, blurRadius: 5, spreadRadius: 1, offset: const Offset(0,2))]),
                width: MediaQuery.of(context).size.width,
                child: Padding(padding:  EdgeInsets.symmetric(vertical : Dimensions.paddingSizeDefault),
                    child : Column(children: [
                        GestureDetector(onTap: ()=> riderController.setFullView(),
                          child: Container(height: 10, width: 40,
                            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceTint,
                              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)))),
                        OrderInfoWithCustomerWidget(orderModel: orderModel, fromMap: true,),

                      ],
                    )
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
