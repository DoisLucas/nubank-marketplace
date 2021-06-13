import 'package:nubank_marketplace/domain/entities/customer.dart';

abstract class GetCustomerData {
  Future<Customer> getCustomerData(String offerId);
}
