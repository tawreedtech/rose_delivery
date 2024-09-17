import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/common/controllers/localization_controller.dart';
import 'package:rose_delivery/features/profile/domain/models/userinfo_model.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/common/basewidgets/custom_image_widget.dart';

class ProfileInfoWidget extends StatelessWidget {
  final bool isChat;
  final UserInfoModel? profileModel;
  const ProfileInfoWidget({Key? key, this.profileModel, this.isChat = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isChat? 100 : 120,
      width: MediaQuery.of(context).size.width,
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(height: Dimensions.profileImageSize, width: Dimensions.profileImageSize,
                decoration: BoxDecoration(shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).cardColor, width: 3)),

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CustomImageWidget(image: '${profileModel!.imageFullUrl?.path}',width: 30,height: 30,)),
              ),
              SizedBox(width: Get.find<LocalizationController>().isLtr? 0: Dimensions.paddingSizeSmall),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profileModel!.fName != null ? '${profileModel!.fName ?? ''} ${profileModel!.lName ?? ''}' : "",maxLines: 1,overflow: TextOverflow.ellipsis,
                          style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                              color: Get.isDarkMode ? Theme.of(context).primaryColorLight :Colors.white)),
                       SizedBox(height: Dimensions.paddingSizeExtraSmall),
                      Text('${profileModel!.countryCode ?? ""} ${profileModel!.phone ?? ''}',
                          style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Get.isDarkMode ? Theme.of(context).primaryColorLight :Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width:  Dimensions.logoHeight,),
            ],
          ),
            SizedBox(height:isChat? 0 : Dimensions.paddingSizeLarge),
        ],
      ),
    );
  }
}
