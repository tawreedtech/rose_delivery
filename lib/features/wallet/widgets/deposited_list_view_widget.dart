import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/wallet/controllers/wallet_controller.dart';
import 'package:rose_delivery/common/basewidgets/custom_loader_widget.dart';
import 'package:rose_delivery/common/basewidgets/no_data_screen_widget.dart';
import 'package:rose_delivery/features/wallet/widgets/deposited_card_widget.dart';

class DepositedListViewWidget extends StatelessWidget {
  const DepositedListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        builder: (walletController) {
          return !walletController.isLoading? walletController.depositedList.isNotEmpty?
          ListView.builder(
              itemCount: walletController.depositedList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index)=> DepositedCardWidget(deposit: walletController.depositedList[index])):
          const NoDataScreenWidget(): CustomLoaderWidget(height: Get.height-600,);
        }
    );
  }
}
