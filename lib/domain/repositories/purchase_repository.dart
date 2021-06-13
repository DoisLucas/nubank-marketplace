import 'package:nubank_marketplace/domain/entities/purchase_result.dart';

abstract class PurchaseRepository {
  Future<PurchaseResult> purchase({required String offerId});
}
