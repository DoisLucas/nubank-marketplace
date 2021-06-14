import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank_marketplace/commons/strings.dart';
import 'package:nubank_marketplace/commons/theme.dart';

class Utils {
  static const String _kApiUrl = "https://staging-nu-needful-things.nubank.com.br/query";

  static String getApiUrl() {
    return _kApiUrl;
  }

  static String toMoney(int value) {
    final currency = NumberFormat.currency(symbol: '\$');
    return currency.format(value);
  }

  static void handlePurchaseResult({
    required BuildContext context,
    required String title,
    bool isError = false,
  }) {
    Utils.showSnackBar(
      title: isError ? title : Strings.successPurchase,
      context: context,
      icon: isError ? Icons.warning_amber_outlined : Icons.check_circle_outline,
    );
  }

  static void showSnackBar({required String title, required BuildContext context, IconData? icon}) {
    Flushbar(
      messageText: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      backgroundColor: NuTheme.kDark,
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(5),
      icon: Icon(
        icon,
        color: NuTheme.kGrayColor,
        size: 25,
      ),
      duration: Duration(seconds: 6),
      shouldIconPulse: false,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
    )..show(context);
  }
}
