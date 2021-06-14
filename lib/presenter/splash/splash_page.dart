import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_marketplace/commons/theme.dart';
import 'package:nubank_marketplace/presenter/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  late final SplashController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: NuTheme.kMainColor,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: NuTheme.kMainColor,
        brightness: Brightness.dark,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/logo/nu.png',
                color: Colors.white,
                width: 90,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 20,
              ),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
