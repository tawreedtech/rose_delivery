import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/styles.dart';


class ProfileDeliveryInfoItemWidget extends StatelessWidget {
  final String? icon;
  final double? countNumber;
  final String? title;
  final bool isAmount;
  const ProfileDeliveryInfoItemWidget({Key? key, this.icon, this.countNumber, this.title, this.isAmount = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
      child: Container(height: 148,
        width: MediaQuery.of(context).size.width/3.8,
        padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),decoration: BoxDecoration(
        color: Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.125) : Theme.of(context).primaryColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),),child: Column(children: [
          Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeOverLarge)),
              child: Container(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                      color: Get.isDarkMode? Theme.of(context).cardColor : Theme.of(context).primaryColor.withOpacity(.75)),
                  width: 40,child: Image.asset(icon!))),

          Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              isAmount? Text(Get.find<SplashController>().myCurrency!.symbol!,
                style: rubikMedium.copyWith(color: Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).colorScheme.primary, fontSize: Dimensions.fontSizeLarge),):const SizedBox(),
              Text(NumberFormat.compact().format(countNumber),
                  style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge,color: Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).colorScheme.primary)),
            ])),
          Text(title!.tr,textAlign: TextAlign.center,style: rubikRegular.copyWith(color: Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).colorScheme.primary),overflow: TextOverflow.ellipsis,),
      ],),),
    );
  }
}