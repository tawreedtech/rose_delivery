import 'package:get/get.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';

class PriceConverter {

  static String convertPrice(double? price, {double? discount, String? discountType,
    int asFixed = 2}) {
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price! - discount;
      }else if(discountType == 'percent') {
        price = price! - ((discount / 100) * price);
      }
    }
    final bool _singleCurrency = Get.find<SplashController>().configModel!.currencyModel == 'single_currency';
    return '${Get.find<SplashController>().myCurrency!.symbol} '
        '${(_singleCurrency ? price: price! * Get.find<SplashController>().myCurrency!.exchangeRate!
        * (1/Get.find<SplashController>().usdCurrency!.exchangeRate!))!.toStringAsFixed(Get.find<SplashController>().configModel!.decimalPointSetting??1).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  static double convertWithDiscount(double price, double discount, String discountType) {
    if(discountType == 'amount') {
      price = price - discount;
    }else if(discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double calculation(double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(String price, String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : Get.find<SplashController>().myCurrency!.symbol} OFF';
  }
}