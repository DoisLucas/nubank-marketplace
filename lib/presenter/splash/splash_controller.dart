import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_marketplace/commons/commons.dart';
import 'package:nubank_marketplace/commons/utils.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';
import 'package:nubank_marketplace/presenter/customer_controller.dart';
import 'package:nubank_marketplace/presenter/home/home_page.dart';

class SplashController extends GetxController {
  late Customer customer;
  final BuildContext context;
  GetCustomerData _getCustomerData = Get.find(tag: 'get_customer_data');

  SplashController({required this.context}) {
    getData(context).then((value) {
      if (value != null) {
        Get.put(CustomerController(customer: value), tag: 'customer_controller');
        Get.off(() => HomePage(), transition: Transition.fade);
      } else {
        showError();
      }
    });
  }

  Future<Customer?> getData(BuildContext context) async {
    try {
      return await _getCustomerData.getCustomerData();
    } catch (e) {
      showError();
    }
  }

  void showError() {
    Utils.showSnackBar(title: 'Network error!', context: context, icon: Icons.error_outline);
  }
}
