import 'entities.dart';

class Customer {
  final String id;
  final String name;
  final List<Offer>? offers;
  int balance;

  Customer({
    required this.id,
    required this.name,
    required this.balance,
    this.offers,
  });
}
