import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/styles.dart';
class PassView extends StatelessWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        builder: (authController) {
          return Padding(
            padding:  EdgeInsets.only(top: Dimensions.paddingSizeSmall),
            child: Wrap(children: [

              view('8_or_more_character'.tr, authController.lengthCheck),

              view('1_number'.tr, authController.numberCheck),

              view('1_upper_case'.tr, authController.uppercaseCheck),

              view('1_lower_case'.tr, authController.lowercaseCheck),

              view('1_special_character'.tr, authController.spatialCheck),

            ]),
          );
        }
    );
  }

  Widget view(String title, bool done){
    return Padding(
      padding:  EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(done ? Icons.check : Icons.clear, color: done ? Colors.green : Colors.red, size: 12),
        Text(title, style: rubikRegular.copyWith(color: done ? Colors.green : Colors.red, fontSize: 12))
      ]),
    );
  }
}
