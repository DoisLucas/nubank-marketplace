import 'package:nubank_marketplace/domain/entities/purchase_result.dart';

abstract class MakePurchase {
  Future<PurchaseResult> purchase(String offerId);
}
