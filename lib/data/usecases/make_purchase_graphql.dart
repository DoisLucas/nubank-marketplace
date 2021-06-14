import 'package:nubank_marketplace/data/graphql/graphql.dart';
import 'package:nubank_marketplace/data/models/models.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';

class MakePurchaseGraphql implements MakePurchase {
  final GraphqlClient graphqlClient;

  MakePurchaseGraphql({required this.graphqlClient});

  @override
  Future<PurchaseResult> purchase(String offerId) async {
    final result = await graphqlClient.mutate(query: purchaseQuery(offerId));
    if (result.hasException) throw Exception('Error on purchase query');
    return PurchaseResultModel.fromJson(result.data['purchase']);
  }

  static String purchaseQuery(String id) {
    return """mutation {
    purchase (offerId: \"$id\") {
        success
        errorMessage
        customer {
            id
            name
            balance
        }
      }
    }""";
  }
}
