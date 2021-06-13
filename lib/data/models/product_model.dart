import 'package:nubank_marketplace/domain/entities/product.dart';

class ProductModel extends Product {
  final String id;
  final String name;
  final String description;
  final String image;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  }) : super(id: id, name: name, description: description, image: image);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
