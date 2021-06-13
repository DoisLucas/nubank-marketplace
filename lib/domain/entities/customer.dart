import 'offer.dart';

class Customer {
  String id;
  String name;
  int balance;
  List<Offer> offers;

  Customer({
    required this.id,
    required this.name,
    required this.balance,
    required this.offers,
  });
}
