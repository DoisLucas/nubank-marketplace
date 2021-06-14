import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank_marketplace/commons/theme.dart';

class Utils {
  static const String _kApiUrl = "https://staging-nu-needful-things.nubank.com.br/query";

  static String getApiUrl() {
    return _kApiUrl;
  }

  static String toMoney(int value) {
    final currency = NumberFormat.currency(symbol: 'R\$', locale: 'ptBr');
    return currency.format(value);
  }

  static void showSnackBar({required String title, required BuildContext context, IconData? icon}) {
    Flushbar(
      messageText: Text(
        title,
        style: TextStyle(
          fontFamily: 'Graphik',
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      backgroundColor: NuTheme.kDark,
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(5),
      icon: Icon(icon, color: NuTheme.kGrayColor, size: 25,),
      duration: Duration(seconds: 6),
      shouldIconPulse: false,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
    )..show(context);
  }
}
