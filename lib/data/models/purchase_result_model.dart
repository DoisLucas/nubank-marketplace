import 'package:nubank_marketplace/data/models/customer_model.dart';
import 'package:nubank_marketplace/domain/entities/purchase_result.dart';

class PurchaseResultModel extends PurchaseResult {
  final bool success;
  final String errorMessage;
  final CustomerModel customer;

  const PurchaseResultModel({
    required this.success,
    required this.errorMessage,
    required this.customer,
  }) : super(success: success, errorMessage: errorMessage, customer: customer);

  factory PurchaseResultModel.fromJson(Map<String, dynamic> json) {
    return PurchaseResultModel(
      success: json['success'],
      errorMessage: json['errorMessage'],
      customer: CustomerModel.fromJson(
        json['customer'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['errorMessage'] = errorMessage;
    data['customer'] = customer.toJson();
    return data;
  }
}
