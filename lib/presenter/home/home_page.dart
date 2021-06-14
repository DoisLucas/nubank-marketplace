import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nubank_marketplace/commons/components/outline_button.dart' as nuOutlineButton;
import 'package:nubank_marketplace/commons/strings.dart';
import 'package:nubank_marketplace/commons/theme.dart';
import 'package:nubank_marketplace/commons/utils.dart';
import 'package:nubank_marketplace/presenter/home/home_controller.dart';
import 'package:nubank_marketplace/presenter/marketplace/marketplace_page.dart';

class HomePage extends StatelessWidget {
  late final HomeController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: NuTheme.kMainColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: NuTheme.kMainColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildAppBar(context),
            buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Text(
            "${Strings.hello}, ${controller.customerController.getCustomer().name}",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Obx(
            () => GestureDetector(
              onTap: () {
                controller.toggleHide();
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: NuTheme.kMainMiddleColor,
                  borderRadius: BorderRadius.circular(45 / 2),
                ),
                child: Icon(
                  controller.isHide.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: NuTheme.kGrayLowColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: NuTheme.kMainMiddleColor,
              borderRadius: BorderRadius.circular(45 / 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25 / 2),
                            color: NuTheme.kGrayLowColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            Strings.account,
                            style: TextStyle(
                              fontSize: 12,
                              color: NuTheme.kGrayColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Strings.balance,
                      style: TextStyle(
                        fontFamily: 'Graphik',
                        fontSize: 10,
                        color: NuTheme.kGrayColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () {
                        if (controller.isHide.value) {
                          return Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            color: NuTheme.kGrayLowColor,
                          );
                        } else {
                          return Text(
                            "${Utils.toMoney(controller.customerController.getCustomer().balance)}",
                            style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: NuTheme.kMainLowColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            Strings.nuStore,
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 0.5,
                              color: NuTheme.kMainColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Strings.discoverDescription,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    nuOutlineButton.OutlineButton(
                      text: Strings.discover,
                      onPressed: () {
                        Get.to(
                          () => MarketplacePage(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
