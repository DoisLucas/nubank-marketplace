import 'package:nubank_marketplace/domain/entities/product.dart';

class Offer {
  String id;
  int price;
  Product product;

  Offer({
    required this.id,
    required this.price,
    required this.product,
  });
}
