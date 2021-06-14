import 'package:get/get.dart';

import '../customer_controller.dart';

class HomeController {
  final CustomerController customerController = Get.find(tag: 'customer_controller');
  Rx<bool> isHide = Rx<bool>(false);

  void toggleHide() {
    isHide.value = !isHide.value;
  }
}
