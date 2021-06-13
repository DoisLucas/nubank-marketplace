import 'entities.dart';

class PurchaseResult {
  final bool success;
  final String errorMessage;
  final Customer customer;

  const PurchaseResult({
    required this.success,
    required this.errorMessage,
    required this.customer,
  });
}
