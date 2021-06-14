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
import 'package:nubank_marketplace/domain/entities/customer.dart';

class MarketplacePage extends StatelessWidget {
  final Customer? customer;

  const MarketplacePage({Key? key, this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 10,
        ),
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
              padding: EdgeInsets.only(
                right: 25,
                left: 25,
                top: 10,
                bottom: 25,
              ),
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
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: customer!.offers.map((e) => ProductCardVertical(offer: e)).toList(),
              ),
            ),
            SectionDivider(),
            SectionTitle(title: "Os queridinhos"),
            Column(
              children: customer!.offers.map((e) => ProductCardHorizontal(offer: e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
