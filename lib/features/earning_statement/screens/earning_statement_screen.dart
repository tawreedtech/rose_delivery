import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/wallet/controllers/wallet_controller.dart';
import 'package:rose_delivery/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_delivery/common/basewidgets/sliver_deligate_widget.dart';
import 'package:rose_delivery/features/earning_statement/widgets/earning_filter_button_widget.dart';
import 'package:rose_delivery/features/earning_statement/widgets/earning_statement_list_widget.dart';

class EarningStatementScreen extends StatelessWidget {
  const EarningStatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<WalletController>().getOrderWiseDeliveryCharge('', '', 1,'');
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'earning_statement'.tr, isBack: true),
      body: RefreshIndicator(
        onRefresh: () async{
          Get.find<WalletController>().setEarningFilterIndex(Get.find<WalletController>().orderTypeFilterIndex);
        },
        child: CustomScrollView(slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegateWidget(
                    containerHeight: 80,
                    child: const EarningFilterButtonWidget())),

            SliverToBoxAdapter(child: Column(children:  [

              GetBuilder<WalletController>(
                builder: (walletController) {
                  return EarningStatementListViewWidget(walletController: walletController);
                }
              ),
            ],),)
          ],
        ),
      ),
    );
  }
}
