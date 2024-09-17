import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/common/basewidgets/online_offline_button_widget.dart';


class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBack;
  final Function()? onTap;
  final bool isSwitch;

  const CustomAppBarWidget({Key? key, this.title, this.isBack = false, this.onTap, this.isSwitch  = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        leading: isBack? GestureDetector(onTap: onTap  ?? ()=>Get.back(),
            child: Icon(Icons.arrow_back_ios,color: Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5) : Theme.of(context).primaryColor)):
        Padding(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Image.asset(Images.splashLogo, height: 30, width: 30),),
        titleSpacing: 0,
        elevation: 1,
        title: Text(title!.tr, maxLines: 1, overflow: TextOverflow.ellipsis, style: rubikMedium.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge,)),
        actions:  [
          isSwitch?
          const OnlineOfflineButtonWidget(): const SizedBox(),
           SizedBox(width: Dimensions.paddingSizeSmall),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(1170, 50);
}