import 'package:get/get.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';
import 'package:nubank_marketplace/presenter/home/home_page.dart';

class SplashController extends GetxController {
  GetCustomerData _getCustomerData = Get.find(tag: 'get_customer_data');
  late Customer customer;

  SplashController() {
    getData().then((value) {
      Get.to(() => HomePage(customer: value), transition: Transition.fade);
    });
  }

  Future<Customer> getData() async {
    return await _getCustomerData.getCustomerData();
  }
}
