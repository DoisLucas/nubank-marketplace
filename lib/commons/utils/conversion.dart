import 'package:intl/intl.dart';

String toMoney(int value) {
  final currency = NumberFormat.currency(symbol: 'R\$ ', locale: 'ptBr');
  return currency.format(value);
}
