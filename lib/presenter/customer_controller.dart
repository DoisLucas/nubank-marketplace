import 'package:get/get.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';

class CustomerController extends GetxController {
  late final Rx<Customer> _customer;

  CustomerController({required Customer customer}) {
    _customer = Rx<Customer>(customer);
  }

  void setCustomer({required Customer customer}) {
    _customer.value = customer;
    _customer.refresh();
  }

  void updateBalance(int value) {
    _customer.value.balance = value;
    _customer.refresh();
  }

  Customer getCustomer() {
    return _customer.value;
  }
}
