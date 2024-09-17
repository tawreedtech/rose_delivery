import 'package:flutter/material.dart';
import 'package:rose_delivery/theme/controllers/theme_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/features/order/widgets/order_item_info_widget.dart';
import 'package:get/get.dart';


class PaymentInfoWidget extends StatelessWidget {
  final double? itemsPrice;
  final double? discount;
  final double? tax;
  final double? subTotal;
  final double? deliveryCharge;
  final double? totalPrice;

  const PaymentInfoWidget({Key? key, this.itemsPrice, this.discount, this.tax, this.subTotal, this.deliveryCharge, this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(color: Theme.of(context).cardColor,
            boxShadow: [BoxShadow(color: Get.find<ThemeController>().darkTheme ? Colors.black.withOpacity(0.10) : Colors.grey[100]!,
              blurRadius: 5, spreadRadius: 1,)],
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
        child: Column(children: [

          Row(children: [
            SizedBox(width: 20, child: Image.asset(Images.paymentInfo)),
            Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                vertical: Dimensions.paddingSizeDefault),
              child: Text('payment_info'.tr,style: rubikMedium.copyWith(
                  color: Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5) :
                  Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeLarge)))]),


         Padding(padding:  EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0, Dimensions.paddingSizeDefault, 0),
           child: Column(children: [
             OrderItemInfoWidget(title: 'product_price',info: itemsPrice.toString(), isPrice: true,isCount: true),
             OrderItemInfoWidget(title: 'discount',info: discount.toString(), isPrice: true,),
             OrderItemInfoWidget(title: 'tax',info: tax.toString(), isPrice: true),
             OrderItemInfoWidget(title: 'delivery_cost',info: deliveryCharge.toString(), isPrice: true),
             Divider(height: .0725, color: Theme.of(context).hintColor.withOpacity(.5)),
             OrderItemInfoWidget(title: 'grand_total',
               textColor: Get.isDarkMode ? Theme.of(context).hintColor : Theme.of(context).primaryColor, info: totalPrice.toString(),isPrice: true,),]))
        ]));
  }
}
