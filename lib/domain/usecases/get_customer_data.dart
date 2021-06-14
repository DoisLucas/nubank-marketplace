import '../entities/entities.dart';

abstract class GetCustomerData {
  Future<Customer?> getCustomerData();
}
