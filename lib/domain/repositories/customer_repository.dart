import 'package:nubank_marketplace/domain/entities/customer.dart';

abstract class CustomerRepository {
  Future<Customer> getCustomerData ({required String id});
}