import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/styles.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  const CustomTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeDefault),
      child: Text(title.tr,style: rubikMedium.copyWith(color: Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5) : Theme.of(context).primaryColor,
          fontSize: Dimensions.fontSizeLarge)),
    );
  }
}
