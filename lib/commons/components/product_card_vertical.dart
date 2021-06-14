import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nubank_marketplace/commons/utils/conversion.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';

import '../theme.dart';

class ProductCardVertical extends StatelessWidget {
  final Offer offer;

  const ProductCardVertical({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: NuTheme.kGrayLowColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CachedNetworkImage(
                      imageUrl: offer.product.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                offer.product.name,
                style: TextStyle(
                  fontFamily: 'Graphik',
                  fontSize: 15,
                  letterSpacing: 0.5,
                  color: NuTheme.kMainColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${toMoney(offer.price)}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Graphik',
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: NuTheme.kMainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "COMPRAR",
                    style: TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
