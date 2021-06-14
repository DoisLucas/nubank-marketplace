import '../../domain/entities/entities.dart';
import 'models.dart';

class PurchaseResultModel extends PurchaseResult {
  final bool success;
  final String errorMessage;
  final CustomerModel? customer;

  const PurchaseResultModel({
    required this.success,
    required this.errorMessage,
    this.customer,
  }) : super(success: success, errorMessage: errorMessage, customer: customer);

  factory PurchaseResultModel.fromJson(Map<String, dynamic> json) {
    return PurchaseResultModel(
      success: json['success'],
      errorMessage: json['errorMessage'] ?? '',
      customer: json['customer'] != null ? CustomerModel.fromJson(json['customer']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['errorMessage'] = errorMessage;
    data['customer'] = customer!.toJson();
    return data;
  }
}
