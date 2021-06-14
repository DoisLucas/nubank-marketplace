import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nubank_marketplace/commons/components/circle_button.dart';
import 'package:nubank_marketplace/commons/components/product_card_horizontal.dart';
import 'package:nubank_marketplace/commons/components/product_card_vertical.dart';
import 'package:nubank_marketplace/commons/components/section_divider.dart';
import 'package:nubank_marketplace/commons/components/section_title.dart';
import 'package:nubank_marketplace/commons/theme.dart';
import 'package:nubank_marketplace/commons/utils/conversion.dart';
import 'package:nubank_marketplace/commons/utils/utils.dart';
import 'package:nubank_marketplace/domain/entities/customer.dart';
import 'package:nubank_marketplace/domain/entities/purchase_result.dart';
import 'package:nubank_marketplace/presenter/marketplace/marketplace_controller.dart';

class MarketplacePage extends StatelessWidget {
  final Customer? customer;
  late final MarketPlaceController controller;

  MarketplacePage({Key? key, this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.put(MarketPlaceController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: NuTheme.kGrayColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: NuTheme.kGrayColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Text(
                "Saldo disponível",
                style: TextStyle(
                  fontFamily: 'Graphik',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: NuTheme.kGrayColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 25),
              child: Text(
                "${toMoney(customer?.balance ?? 0)}",
                style: TextStyle(
                  fontFamily: 'Graphik',
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  CircleButton(
                    text: 'Favoritos',
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  CircleButton(
                    text: 'Pedidos',
                    baloonText: '2',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SectionDivider(),
            SectionTitle(title: "Promoção do dia"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: customer!.offers!.map(
                  (e) {
                    return ProductCardVertical(
                      offer: e,
                      onButtonTap: () async {
                        PurchaseResult result = await controller.buy(e.id);
                        handleResult(
                          title: result.errorMessage,
                          context: context,
                          isError: !result.success,
                        );
                      },
                      onCardTap: () {
                        //Get.to - PDP
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            SectionDivider(),
            SectionTitle(title: "Os queridinhos"),
            Column(
              children: customer!.offers!.map(
                (e) {
                  return ProductCardHorizontal(
                    offer: e,
                    onButtonTap: () async {
                      PurchaseResult result = await controller.buy(e.id);
                      handleResult(
                        title: result.errorMessage,
                        context: context,
                        isError: !result.success,
                      );
                    },
                    onCardTap: () {
                      //Get.to - PDP
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void handleResult({
    required BuildContext context,
    required String title,
    bool isError = false,
  }) {
    Utils.showSnackBar(
      title: isError ? title : "Purchase  made successfully",
      context: context,
      icon: isError ? Icons.error_outline : Icons.check_circle_outline,
    );
  }
}
