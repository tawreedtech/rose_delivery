import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/live_tracking/screens/order_tracking_screen.dart';
import 'package:rose_delivery/features/order/controllers/order_controller.dart';
import 'package:rose_delivery/features/order/domain/models/order_model.dart';
import 'package:rose_delivery/features/order_details/screens/order_details_screen.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';
import 'package:rose_delivery/helper/date_converter.dart';
import 'package:rose_delivery/theme/controllers/theme_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/features/home/widgets/on_going_order_header_widget.dart';
import 'package:rose_delivery/features/home/widgets/receiver_widget.dart';



class OnGoingOrderWidget extends StatelessWidget {
  final OrderModel? orderModel;
  final int? index;
  const OnGoingOrderWidget({Key? key, this.orderModel, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.fromLTRB(0, 0, 0, Dimensions.paddingSizeSmall),
      child: Container(decoration: BoxDecoration(color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
        boxShadow:  [BoxShadow(color: Get.find<ThemeController>().darkTheme ? Colors.black.withOpacity(0.10) : Colors.grey[100]!,
            blurRadius: 5, spreadRadius: 1, offset: const Offset(0,2))],),
        padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),

        child: ExpandableNotifier(
          child: Column(children: [
              Expandable(collapsed: ExpandableButton(
                  child: Column(children: [
                    OngoingOrderHeaderWidget(orderModel: orderModel,index: index)])),
                expanded: Column(children: [

                      GestureDetector(onTap: (){
                            Get.to(()=>OrderDetailsScreen(orderModel: orderModel));
                            Get.find<OrderController>().selectedOrderLatLng(orderModel?.shippingAddress?.latitude??'23',
                                orderModel?.shippingAddress?.longitude??'90');
                            },
                          child: Container(color: Theme.of(context).primaryColor.withOpacity(.0),
                              child: OngoingOrderHeaderWidget(orderModel: orderModel,index: index,isExpanded: true))),

                      Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                          Row(mainAxisAlignment: MainAxisAlignment.start, children: [

                            SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                                color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.25) :
                                Theme.of(context).primaryColor.withOpacity(.5))),
                            SizedBox(width: Dimensions.paddingSizeSmall),
                            Text('${'assigned'.tr} : ',style: rubikRegular.copyWith(color:
                            Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                            Text(DateConverter.isoStringToLocalDateOnly(orderModel!.createdAt!),
                                style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Get.isDarkMode ? Theme.of(context).hintColor : Colors.black))]),


                          orderModel!.expectedDate != null?
                          Padding(padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
                            child: Row(children: [
                              SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                                  color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.25) :
                                  Theme.of(context).primaryColor.withOpacity(.5))),
                              SizedBox(width: Dimensions.paddingSizeSmall),
                              Text('${'expected_date'.tr} : ',
                                style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                              Text(orderModel!.expectedDate??'', style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Get.isDarkMode ? Theme.of(context).hintColor : Colors.black))]),
                          ):const SizedBox(),
                        ])),


                      SizedBox(height: Dimensions.paddingSizeSmall,),
                      Get.find<SplashController>().configModel!.mapApiStatus == 1 ?
                      GestureDetector(onTap: () => Get.to(()=> OrderLiveTrackingScreen(orderModel: orderModel)),
                        child: Container(height: Get.width/3,
                          padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                          child: Image.asset(Images.previewMap, fit: BoxFit.cover))) : const SizedBox(),

                      ReceiverWidget(orderModel: orderModel),

                      ExpandableButton(child: Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.123):
                          Theme.of(context).primaryColor.withOpacity(.08)),
                            padding:  EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                            child:  Icon(Icons.keyboard_arrow_up, size: Dimensions.iconSizeLarge,
                              color : Theme.of(context).primaryColor.withOpacity(.75)))),
                ])),
            ],
          ),
        ),
      ),
    );
  }
}





