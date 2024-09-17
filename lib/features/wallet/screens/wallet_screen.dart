import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/features/wallet/controllers/wallet_controller.dart';
import 'package:rose_delivery/features/wallet/domain/models/transaction_type_model.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:rose_delivery/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_delivery/common/basewidgets/sliver_deligate_widget.dart';
import 'package:rose_delivery/features/wallet/widgets/deposited_list_view_widget.dart';
import 'package:rose_delivery/features/wallet/widgets/transaction_list_view_widget.dart';
import 'package:rose_delivery/features/wallet/widgets/transaction_search_filter_widget.dart';
import 'package:rose_delivery/features/wallet/widgets/transaction_type_card_widget.dart';
import 'package:rose_delivery/features/wallet/widgets/wallet_withdraw_send_card_widget.dart';
import 'package:rose_delivery/features/withdraw/widgets/withdraw_list_view_widget.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<TransactionTypeModel> _transactionTypes = [
    TransactionTypeModel(Images.delivery, 'delivery_charge_earned', Get.find<ProfileController>().profileModel!.totalEarn, 0),
    TransactionTypeModel(Images.withdrawn, 'withdrawn', Get.find<ProfileController>().profileModel!.totalWithdraw, 1),
    TransactionTypeModel(Images.pendingWithdraw, 'pending_withdrawn', Get.find<ProfileController>().profileModel!.pendingWithdraw, 2),
    TransactionTypeModel(Images.deposit, 'already_deposited', Get.find<ProfileController>().profileModel!.totalDeposit, 3),
  ];

  @override
  void initState() {
    Get.find<WalletController>().getOrderWiseDeliveryCharge('', '', 1,'');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWidget(title: 'my_wallet'.tr,isBack: true,),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegateWidget(
                    containerHeight: 200,
                      child: const WalletSendWithdrawCardWidget())),


              SliverToBoxAdapter(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                    child: GetBuilder<WalletController>(
                      builder: (walletController) {
                        String title = walletController.selectedItem == 0?
                        _transactionTypes[0].title:
                        walletController.selectedItem == 1?
                        _transactionTypes[1].title:
                        walletController.selectedItem == 2?
                        _transactionTypes[2].title:
                        _transactionTypes[3].title;

                        return Column(crossAxisAlignment: CrossAxisAlignment.start, children:  [
                          SizedBox(height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _transactionTypes.length,
                              itemBuilder: (BuildContext context, int index) {

                              return GestureDetector(
                                onTap: (){

                                  walletController.selectedItemForFilter(index, fromTop: true);
                                },
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                                    child: TransactionCardWidget(transactionTypeModel: _transactionTypes[index], selectedIndex: walletController.selectedItem),
                                  ));
                              },
                             ),
                          ),

                          const DeliverySearchFilterWidget(),
                          Padding(
                            padding:  EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault,
                                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
                            child: Text(title.tr, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          ),

                          walletController.selectedItem == 0?
                          const TransactionListViewWidget():
                          walletController.selectedItem == 3?
                          const DepositedListViewWidget():
                          const WithdrawListViewWidget()

                        ],);
                      }
                    ),
                  )
              )
            ],


          ),
        ),
      ),

    );

  }
}


