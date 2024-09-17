import 'package:flutter/material.dart';
import 'package:rose_delivery/common/basewidgets/custom_image_widget.dart';
import 'package:rose_delivery/features/order_details/controllers/order_details_controller.dart';
import 'package:rose_delivery/helper/price_converter.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:get/get.dart';

class OrderedItemProductListWidget extends StatelessWidget {
  final OrderDetailsController? orderController;
  const OrderedItemProductListWidget({Key? key, this.orderController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: orderController!.orderDetails!.length == 1 ?  185 : orderController!.orderDetails!.length < 5 ?  185 + (100 * orderController!.orderDetails!.length - 1) : 595,
      child: Container(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(color:Get.isDarkMode ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(Dimensions.paddingSizeDefault),
            topRight: Radius.circular(Dimensions.paddingSizeDefault))),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
                child: Text('item_info'.tr, style: rubikMedium.copyWith(
                   color: Theme.of(context).colorScheme.secondary,fontSize: Dimensions.fontSizeLarge))),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orderController!.orderDetails!.length,
                itemBuilder: (context, index) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                        child: Text('${'item'.tr} ${index+1}',
                            style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeDefault))),

                    Row(children: [
                      SizedBox(height: Dimensions.productImageSizeOrderDetails,
                        width: Dimensions.productImageSizeOrderDetails,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: CustomImageWidget( image: '${orderController!.orderDetails![index].productDetails!.thumbnailFullUrl?.path}',
                              height: Dimensions.productImageSizeOrderDetails,
                              width: Dimensions.productImageSizeOrderDetails, fit: BoxFit.cover)),),
                         SizedBox(width: Dimensions.paddingSizeSmall),


                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Row(children: [
                                Expanded(child: Text(orderController?.orderDetails?[index].productDetails!.name??'',
                                  style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
                                      color: Theme.of(context).highlightColor),
                                  maxLines: 2, overflow: TextOverflow.ellipsis))],),
                                SizedBox(height: Dimensions.paddingSizeExtraSmall),

                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [Row(children: [
                                      Text('${'quantity'.tr} : ',
                                          style: rubikRegular.copyWith(color: Theme.of(context).highlightColor)),

                                      Text(' ${orderController!.orderDetails![index].qty}',
                                          style: rubikMedium.copyWith(color: Get.isDarkMode ? Theme.of(context).hintColor : Theme.of(context).primaryColor))])]),


                                orderController!.orderDetails![index].variant != ''?
                                Row(children: [
                                    Text('${'variation'.tr} : ',
                                        style: rubikRegular.copyWith(color: Theme.of(context).highlightColor)),
                                    Text(' ${orderController!.orderDetails![index].variant}', style: rubikMedium.copyWith())]): const SizedBox(),

                                Row(children: [
                                  Text('${'price'.tr} (${'per_unit'.tr}) : ',
                                      style: rubikRegular.copyWith(color: Theme.of(context).highlightColor)),
                                  Text(PriceConverter.convertPrice(orderController!.orderDetails![index].price),
                                      style: rubikMedium.copyWith(color: Get.isDarkMode ? Theme.of(context).hintColor : Theme.of(context).primaryColor))])]))]),

                    Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                        child: Divider(height: .5,color: Theme.of(context).hintColor.withOpacity(.5))),
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
