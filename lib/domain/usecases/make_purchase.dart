import '../entities/entities.dart';

abstract class MakePurchase {
  Future<PurchaseResult?> purchase(String offerId);
}
