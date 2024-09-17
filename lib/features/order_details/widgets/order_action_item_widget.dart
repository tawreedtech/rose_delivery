import 'package:flutter/material.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:get/get.dart';

class OrderActionItemWidget extends StatelessWidget {
  final String? icon;
  final String? title;
  final Function() onTap;
  const OrderActionItemWidget({Key? key, this.icon, this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=> onTap(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
        child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(padding:  EdgeInsets.all(Dimensions.paddingSizeLarge),
                width: 50, height:50, decoration: BoxDecoration(
                  color: Get.isDarkMode ? Theme.of(context).cardColor : Theme.of(context).cardColor.withOpacity(.75),
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(.125),
                      blurRadius: 5, spreadRadius: 1)],
                ),child: SizedBox(width: 20, child: Image.asset(icon!))),
             SizedBox(height: Dimensions.paddingSizeSmall),
            Text(title??''.tr),

          ])),
      ),
    );
  }
}