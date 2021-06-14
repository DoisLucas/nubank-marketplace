import 'package:get/get.dart';
import 'package:nubank_marketplace/domain/entities/purchase_result.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';

class MarketPlaceController {
  final MakePurchase _makePurchase = Get.find(tag: "make_purchase");

  Future<PurchaseResult> buy(String offerId) async {
    PurchaseResult result = await _makePurchase.purchase(offerId);
    return result;
  }
}
