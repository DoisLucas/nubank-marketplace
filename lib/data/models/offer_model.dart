import 'package:nubank_marketplace/data/models/product_model.dart';
import 'package:nubank_marketplace/domain/entities/offer.dart';

class OfferModel extends Offer {
  final String id;
  final int price;
  final ProductModel product;

  const OfferModel({
    required this.id,
    required this.price,
    required this.product,
  }) : super(id: id, price: price, product: product);

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      price: json['price'],
      product: ProductModel.fromJson(
        json['product'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['product'] = this.product.toJson();
    return data;
  }
}
