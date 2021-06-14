import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank_marketplace/commons/theme.dart';

class Utils {
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
      borderRadius: BorderRadius.circular(3),
      icon: Icon(icon, color: NuTheme.kGrayColor),
      duration: Duration(seconds: 6),
      shouldIconPulse: false,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
    )..show(context);
  }
}
