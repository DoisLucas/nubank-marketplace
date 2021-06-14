import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nubank_marketplace/commons/components/main_button.dart';
import 'package:nubank_marketplace/commons/strings.dart';
import 'package:nubank_marketplace/commons/theme.dart';
import 'package:nubank_marketplace/commons/utils.dart';
import 'package:nubank_marketplace/domain/entities/offer.dart';

class ProductPage extends StatelessWidget {
  final Offer offer;
  final Function() onBuy;

  ProductPage({Key? key, required this.offer, required this.onBuy}) : super(key: key);

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
              Icons.favorite_border,
              color: NuTheme.kGrayColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: CachedNetworkImage(
                        imageUrl: offer.product.image,
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(color: NuTheme.kMainColor, borderRadius: BorderRadius.circular(8 / 2)),
                    ),
                    Container(
                      padding: EdgeInsets.all(25),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: NuTheme.kGrayLowColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.product.name,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: NuTheme.kMainColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "${Utils.toMoney(offer.price)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(25),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: NuTheme.kGrayLowColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.description,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: NuTheme.kMainColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${offer.product.description}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10,
              ),
              child: MainButton(
                title: Strings.buy,
                heigth: 50,
                fontSize: 14,
                onTap: onBuy,
              ),
            )
          ],
        ),
      ),
    );
  }
}
