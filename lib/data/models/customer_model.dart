import '../../domain/entities/entities.dart';
import 'models.dart';

class CustomerModel extends Customer {
  final String id;
  final String name;
  final List<OfferModel>? offers;
  int balance;

  CustomerModel({
    required this.id,
    required this.name,
    required this.balance,
    this.offers,
  }) : super(id: id, name: name, balance: balance);

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
      offers: json['offers'] != null ? (json['offers'] as List).map((it) => OfferModel.fromJson(it)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['balance'] = this.balance;
    data['offers'] = offers!.map((it) => it.toJson()).toList();
    return data;
  }
}
