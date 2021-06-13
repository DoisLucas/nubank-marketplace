import 'package:nubank_marketplace/domain/entities/customer.dart';
import 'package:nubank_marketplace/domain/repositories/customer_repository.dart';

mixin GetCustomerData {
  Future<Customer> call(String offerId);
}

class GetCustomerDataImpl implements GetCustomerData {
  final CustomerRepository customerRepository;

  GetCustomerDataImpl(this.customerRepository);

  @override
  Future<Customer> call(String id) async {
    return await customerRepository.getCustomerData(id: id);
  }
}
