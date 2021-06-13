import 'product.dart';

class Offer {
  final String id;
  final int price;
  final Product product;

  const Offer({
    required this.id,
    required this.price,
    required this.product,
  });
}
