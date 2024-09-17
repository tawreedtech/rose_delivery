import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';
import 'package:rose_delivery/features/withdraw/controllers/withdraw_controller.dart';
import 'package:rose_delivery/helper/price_converter.dart';
import 'package:rose_delivery/theme/controllers/theme_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/common/basewidgets/custom_button_widget.dart';
import 'package:rose_delivery/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_delivery/common/basewidgets/custom_snackbar_widget.dart';
import 'package:rose_delivery/common/basewidgets/custom_text_field_widget.dart';
import 'package:rose_delivery/features/profile/screens/bank_info_screen.dart';

class BalanceWithdrawScreen extends StatefulWidget {
  const BalanceWithdrawScreen({Key? key}) : super(key: key);
  @override
  State<BalanceWithdrawScreen> createState() => _BalanceWithdrawScreenState();
}
class _BalanceWithdrawScreenState extends State<BalanceWithdrawScreen> {


  final List<int> _suggestedAmount = [1000,2000,3000,4000,5000];
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'withdraw',isBack: true),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
            builder: (profileController) {
              return Column(children: [
                Padding(padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SizedBox(width: 30,child: Image.asset(Images.riderWallet,color: Get.isDarkMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColor,)),
                         SizedBox(width: Dimensions.paddingSizeSmall),

                        Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                          child: Text('total_withdrawable_balance'.tr,
                              style: rubikMedium.copyWith(color:Get.isDarkMode?
                              Theme.of(context).hintColor.withOpacity(.5) :
                              Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeDefault)))]),


                      Text(PriceConverter.convertPrice(profileController.profileModel!.withdrawableBalance),
                          style: rubikBold.copyWith(color: Get.isDarkMode? Colors.white :
                          Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge))])),

                InkWell(onTap: ()=>Get.to(const BankInfoScreen()),
                  child: GetBuilder<ProfileController>(
                    builder: (profileController) {
                      String? accountNumber = profileController.profileModel!.accountNo;
                      String firstPart = '';
                      String lastPart = '';
                      if(accountNumber != null){
                        if(accountNumber.length > 5){
                          firstPart = accountNumber.substring(0, 5);
                          lastPart = accountNumber.substring(accountNumber.length-3, accountNumber.length-1);
                        }else{
                          firstPart = accountNumber;
                        }
                      }
                      String acNumber = accountNumber != null? firstPart+'****************'+lastPart : '04582*****65';

                      return Container(decoration: BoxDecoration(color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                        boxShadow: [BoxShadow(color: Get.find<ThemeController>().darkTheme ? Colors.black.withOpacity(0.10) : Colors.grey[100]!,
                            blurRadius: 5, spreadRadius: 1, offset: const Offset(0,2))]),
                          padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                          child: Row(children: [
                            SizedBox(width: 30,child: Image.asset(Images.bank)),
                             SizedBox(width: Dimensions.paddingSizeDefault,),
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                Text(profileController.profileModel!.bankName?? 'add_a_bank_account'.tr),
                                Text('AC $acNumber',style: rubikRegular.copyWith(color: Theme.of(context).hintColor))])),
                             Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                              child: const Icon(Icons.edit))]));})),

                 SizedBox(height: Dimensions.paddingSizeDefault),


                Container(width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                  boxShadow: [BoxShadow(color: Get.find<ThemeController>().darkTheme ? Colors.black.withOpacity(0.10) : Colors.grey[100]!,
                      blurRadius: 5, spreadRadius: 1, offset: const Offset(0,2))],),
                    padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
                      Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        child: Text('withdraw_amount'.tr, style: rubikBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge))),
                     Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                       child: SizedBox(width: 200, child: Stack(children: [


                           CustomTextFieldWidget(hintText: 'enter_amount'.tr, inputType: TextInputType.phone,
                             inputAction: TextInputAction.done, controller: amountController),


                           Container(transform: Matrix4.translationValues(30.0, 12.0, 0.0),
                             child: Text(Get.find<SplashController>().myCurrency!.symbol!,
                                 style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                     color: Get.isDarkMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColor)))]))),
                      Divider(color: Theme.of(context).primaryColor.withOpacity(.25)),


                      SizedBox(height: 60, child: ListView.builder(itemCount: _suggestedAmount.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (amountContext, index){
                          return InkWell(onTap: ()=> amountController.text = _suggestedAmount[index].toString(),
                            child: Padding(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
                              child: Container(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color:Get.isDarkMode?
                                Theme.of(context).hintColor.withOpacity(.5): Theme.of(context).primaryColor.withOpacity(.75))),
                                child: Center(child: Text(_suggestedAmount[index].toString(),
                                  style: rubikRegular.copyWith(color:Get.isDarkMode?
                                  Theme.of(context).hintColor.withOpacity(.5): Theme.of(context).primaryColor))))));})),


                      Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        child: Text('remark'.tr, style: rubikBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge))),

                      Padding(padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        child: SizedBox(width: 200, child: Row(children: [
                            Expanded(child: CustomTextFieldWidget(hintText: 'remark_text'.tr,
                            controller: noteController))]))),
                      Divider(color: Theme.of(context).primaryColor.withOpacity(.25))])),
              ]);
            }
          ),
        ),
      ),

      bottomNavigationBar: MediaQuery.of(context).viewInsets.bottom == 0?
      GetBuilder<WithdrawController>(
        builder: (withdrawController) {
          return Container(decoration: BoxDecoration(color: Theme.of(context).cardColor),
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
                vertical: Dimensions.paddingSizeDefault),
            height: 80,
            child: !withdrawController.isWithdraw?
            CustomButtonWidget(onTap: (){
              String withdrawAmount =  amountController.text.trim();
              String withdrawNote = noteController.text.trim();
              if(Get.find<ProfileController>().profileModel!.accountNo == '' || Get.find<ProfileController>().profileModel!.accountNo == null) {
                showCustomSnackBarWidget('bank_account_is_required'.tr);
              }else if(withdrawAmount.isEmpty){
                showCustomSnackBarWidget('amount_is_required'.tr);
              }else if(double.parse(withdrawAmount) <= 0){
                showCustomSnackBarWidget('amount_is_greater_than_0'.tr);
              }else{
                withdrawController.sendWithdrawRequest(withdrawAmount, withdrawNote).then((value) {
                  if(value.statusCode == 200){
                    amountController.text = '';
                    noteController.text = '';
                  }
                });
              }
              }, btnTxt: 'send_withdraw_request'.tr):
            Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(width: 40,height: 40, child: CircularProgressIndicator(color: Theme.of(context).primaryColor))]),
          );
        }
      ):const SizedBox(),
    );
  }
}
