
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/common/basewidgets/custom_stepper_widget.dart';

class TrackingStepperWidget extends StatelessWidget {
  final String? status;
  const TrackingStepperWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _status = -1;
    if(status == 'confirmed') {
      _status = 0;
    }else if(status == 'processing') {
      _status = 1;
    }else if(status == 'out_for_delivery') {
      _status = 2;
    }else if(status == 'delivered') {
      _status = 3;
    }

    return Container(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(color: Get.isDarkMode?
      Theme.of(context).colorScheme.secondary :Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      child: Row(children: [
        CustomStepperWidget(title: 'order_confirmed'.tr, isActive: _status > -1,
          hasLeftBar: false, hasRightBar: true, rightActive: _status > 0,
          icon: Images.orderConfirmationIcon,),

        CustomStepperWidget(title: 'order_processing'.tr, isActive: _status > 0, hasLeftBar: true,
          hasRightBar: true, rightActive: _status > 1,
          icon: Images.orderProcessingIcon),

        CustomStepperWidget(
          title: 'out_for_delivery'.tr, isActive: _status > 1, hasLeftBar: true,
            hasRightBar: true, rightActive: _status > 2,
          icon: Images.orderOutForDeliveryIcon),

        CustomStepperWidget(title: 'delivered'.tr, isActive: _status > 2,
          hasLeftBar: true, hasRightBar: false, rightActive: _status > 3,
          icon: Images.orderDeliveredIcon)]));
  }
}
