
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rose_delivery/data/api/api_checker.dart';
import 'package:rose_delivery/features/wallet/domain/models/delivery_wise_earned_model.dart';
import 'package:rose_delivery/features/wallet/domain/models/deposited_model.dart';
import 'package:rose_delivery/features/wallet/domain/repositories/wallet_repository_interface.dart';
import 'package:rose_delivery/features/wallet/domain/services/wallet_service_interface.dart';

class WalletService implements WalletServiceInterface{
  WalletRepositoryInterface walletRepoInterface;
  WalletService({required this.walletRepoInterface});

  @override
  Future getDeliveryWiseEarned({String? startDate, String? endDate, int? offset, String? type}) async{
    Response response = await walletRepoInterface.getDeliveryWiseEarned(startDate: startDate, endDate: endDate, offset: offset, type: type);
   if (response.body != null && response.statusCode == 200) {
     return DeliveryWiseEarnedModel.fromJson(response.body).orders!;
   } else {
     ApiChecker.checkApi(response);
   }
  }

  @override
  Future getDepositedList({String? startDate, String? endDate, int? offset, String? type}) async{
    Response response = await walletRepoInterface.getDepositedList(startDate: startDate, endDate: endDate, offset: offset, type: type);
    if (response.body != null && response.statusCode == 200) {
      return DepositedModel.fromJson(response.body).deposit!;
    } else {
      ApiChecker.checkApi(response);
    }
  }

}