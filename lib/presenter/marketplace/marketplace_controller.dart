import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_marketplace/commons/strings.dart';
import 'package:nubank_marketplace/commons/utils.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';

import '../customer_controller.dart';

class MarketPlaceController {
  final MakePurchase _makePurchase = Get.find(tag: "make_purchase");
  final CustomerController customerController = Get.find(tag: 'customer_controller');

  Future<void> buy({required String offerId, required BuildContext context}) async {
    try {
      PurchaseResult? result = await _makePurchase.purchase(offerId);
      if (result != null) {
        updateCustomerBalance(value: result.customer!.balance);
        showFeedback(context: context, result: result);
      }
    } catch (e) {
      Utils.showSnackBar(title: Strings.networkError, context: context, icon: Icons.error_outline);
    }
  }

  void updateCustomerBalance({required int value}) {
    customerController.updateBalance(value);
  }

  void showFeedback({required BuildContext context, required PurchaseResult result}) {
    Utils.handlePurchaseResult(
      title: result.errorMessage,
      context: context,
      isError: !result.success,
    );
  }
}
