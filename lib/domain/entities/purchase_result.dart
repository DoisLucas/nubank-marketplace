import 'customer.dart';

class PurchaseResult {
  bool success;
  String errorMessage;
  Customer customer;

  PurchaseResult({
    required this.success,
    required this.errorMessage,
    required this.customer,
  });
}
