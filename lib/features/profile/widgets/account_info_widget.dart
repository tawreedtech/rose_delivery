import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/auth/widgets/pass_view.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/common/basewidgets/custom_text_field_widget.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        builder: (profileController) {
          return ListView(physics: const NeverScrollableScrollPhysics(), children: [

              Padding(padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('phone_no'.tr, style: rubikRegular),

                     SizedBox(height: Dimensions.paddingSizeSmall),
                    CustomTextFieldWidget(
                      prefixIconUrl: Images.phone,
                      isDisable: false,
                      noBg: true,
                      isShowBorder: true,
                      fillColor: Theme.of(context).hintColor.withOpacity(.125),
                      hintText: '${profileController.profileModel!.countryCode ?? ""}${profileController.profileModel!.phone ?? ""}',
                    ),
                  ],
                ),
              ),

              Text('password'.tr, style: rubikRegular),
               SizedBox(height: Dimensions.paddingSizeSmall),

              CustomTextFieldWidget(
                controller: profileController.passwordController,
                isShowBorder: true,
                noBg: true,
                hintText: 'password'.tr,
                isShowSuffixIcon: true,
                prefixIconUrl: Images.lock,
                focusNode: profileController.passwordFocus,
                nextFocus: profileController.confirmPasswordFocus,
                inputAction: TextInputAction.next,
                isPassword: true,
                onChanged: (value) {
                  if(value != null && value.isNotEmpty){
                    if(!profileController.showPassView){
                      profileController.showHidePass();
                    }
                    profileController.validPassCheck(value);
                  }else{
                    if(profileController.showPassView){
                      profileController.showHidePass();
                    }
                  }
                },
              ),


              profileController.showPassView ? const PassView() : const SizedBox(),


              Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: Text('re_enter_password'.tr, style: rubikRegular)),

              CustomTextFieldWidget(
                noBg: true,
                hintText: 'confirm_password'.tr,
                isShowSuffixIcon: true,
                prefixIconUrl: Images.lock,
                controller: profileController.confirmPasswordController,
                isShowBorder: true,
                focusNode: profileController.confirmPasswordFocus,
                inputAction: TextInputAction.done,
                isPassword: true,
              ),

               SizedBox(height: Dimensions.paddingSizeDefault,),

            ],
          );
        }
    );
  }
}
