import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/order/controllers/order_controller.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/common/basewidgets/confirmation_dialog_widget.dart';
import 'package:rose_delivery/common/basewidgets/custom_image_widget.dart';
import 'package:rose_delivery/common/basewidgets/flutter_custom_switch_widget.dart';

class OnlineOfflineButtonWidget extends StatelessWidget {
  final bool showProfileImage;
  const OnlineOfflineButtonWidget({Key? key, this.showProfileImage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return GetBuilder<OrderController>(builder: (orderController) {
        return (profileController.profileModel != null) ?
        FlutterCustomSwitchWidget(
          width: showProfileImage ?  100: 40, height: showProfileImage ? 30 : 20,
          valueFontSize: Dimensions.fontSizeDefault, showOnOff: true,
          activeText: showProfileImage ? 'online'.tr : '' ,
          inactiveText: showProfileImage ? 'offline'.tr : '',
          activeColor:  showProfileImage ? Theme.of(context).colorScheme.outline.withOpacity(.25) : Get.isDarkMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColor,
          activeTextColor: Theme.of(context).colorScheme.outline.withOpacity(.75),
          activeToggleBorder: Border.all(color: showProfileImage ? Theme.of(context).colorScheme.outline:
          Get.isDarkMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary, width: 2),
          toggleSize:  showProfileImage ? 30: 20,
          inactiveToggleBorder: Border.all(color: showProfileImage ?
          Theme.of(context).hintColor: Theme.of(context).primaryColor, width: 2),
          activeIcon: showProfileImage ? ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImageWidget(
              image: '${Get.find<ProfileController>().profileModel!.imageFullUrl?.path}',
              height: 30, width: 30, fit: BoxFit.cover)): const SizedBox(),
          inactiveIcon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImageWidget(
              image: '${Get.find<ProfileController>().profileModel!.imageFullUrl?.path}',
              height: 30, width: 30, fit: BoxFit.cover)),
          value: profileController.profileModel!.isActive == 1? true : false,
          onToggle: (bool isActive) async {
              Get.dialog(ConfirmationDialogWidget(
                icon: Images.logo,
                description:profileController.profileModel!.isActive == 1?
                'are_you_sure_go_to_offline'.tr : 'are_you_sure_go_to_online'.tr,
                onYesPressed: () {
                  if(isActive){
                    profileController.profileStatusChange(context, 1);
                  }else{
                    profileController.profileStatusChange(context, 0);
                  }
                },
              ));


          },
        ) : const SizedBox();
      });
    });
  }
}
