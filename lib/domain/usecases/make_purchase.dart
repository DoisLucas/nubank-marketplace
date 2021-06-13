import 'package:nubank_marketplace/domain/entities/purchase_result.dart';
import 'package:nubank_marketplace/domain/repositories/purchase_repository.dart';

mixin MakePurchase {
  Future<PurchaseResult> call(String offerId);
}

class MakePurchaseImpl implements MakePurchase {
  final PurchaseRepository purchaseRepository;

  MakePurchaseImpl(this.purchaseRepository);

  @override
  Future<PurchaseResult> call(String offerId) async {
    return await purchaseRepository.purchase(offerId: offerId);
  }
}
