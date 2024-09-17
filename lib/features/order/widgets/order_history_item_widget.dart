import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/order/domain/models/order_model.dart';
import 'package:rose_delivery/features/order_details/screens/order_details_screen.dart';
import 'package:rose_delivery/features/order_details/widgets/cal_chat_widget.dart';
import 'package:rose_delivery/features/order_details/widgets/customer_info_widget.dart';
import 'package:rose_delivery/helper/date_converter.dart';
import 'package:rose_delivery/theme/controllers/theme_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';



class OrderHistoryItemWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const OrderHistoryItemWidget({Key? key, this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(OrderDetailsScreen(orderModel: orderModel)),
      child: Padding(padding:  EdgeInsets.only(left: Dimensions.paddingSizeSmall,
          bottom : Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
        child: Container(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(color: Theme.of(context).cardColor,
            boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(.125),
                spreadRadius: .7, blurRadius: 2, offset: const Offset(0, 1))],
            borderRadius: BorderRadius.circular(10)),

          child: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(padding:  EdgeInsets.only(left: 7,top: Dimensions.paddingSizeSmall),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Expanded(child: Text('${'order'.tr} #${orderModel!.id}',
                              style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge,
                                  color: Theme.of(context).colorScheme.secondary)),),
                        CallAndChatWidget(orderModel: orderModel)])),


                Padding(padding:  EdgeInsets.fromLTRB( Dimensions.paddingSizeDefault,
                    Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, 0),
                  child: CustomerInfoWidget(orderModel: orderModel, showCustomerImage: true),),

                Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                  child: Column(children: [
                    Row(children: [

                      SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                          color: Get.find<ThemeController>().darkTheme ?Theme.of(context).hintColor.withOpacity(.5) :Theme.of(context).primaryColor.withOpacity(.5))),
                      SizedBox(width: Dimensions.paddingSizeSmall),

                      Text('${'assigned'.tr} : ',style: rubikRegular.copyWith(
                          color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                      Text(DateConverter.isoStringToLocalDateOnly(orderModel!.createdAt!),
                        style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Get.isDarkMode ? Theme.of(context).hintColor : Colors.black),),]),


                    orderModel!.expectedDate != null?
                    Padding(padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
                      child: Row(children: [
                        SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                            color: Get.find<ThemeController>().darkTheme ?Theme.of(context).hintColor.withOpacity(.5) :Theme.of(context).primaryColor.withOpacity(.5))),
                        SizedBox(width: Dimensions.paddingSizeSmall),
                        Text('${'expected_date'.tr} : ',
                          style: rubikRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                        Text(orderModel!.expectedDate!, style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Get.isDarkMode ? Theme.of(context).hintColor : Colors.black))])): const SizedBox(),
                    SizedBox(height: Dimensions.paddingSizeSmall,),
                  ]),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
