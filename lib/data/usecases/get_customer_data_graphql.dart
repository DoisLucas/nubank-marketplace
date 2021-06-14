import 'package:nubank_marketplace/commons/commons.dart';
import 'package:nubank_marketplace/commons/utils.dart';
import 'package:nubank_marketplace/data/graphql/graphql.dart';
import 'package:nubank_marketplace/data/models/models.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';

class GetCustomerDataGraphql implements GetCustomerData {
  final GraphqlClient graphqlClient;

  GetCustomerDataGraphql({required this.graphqlClient});

  @override
  Future<Customer?> getCustomerData() async {
    try {
      final result = await graphqlClient.query(query: customerData());
      if (!result.hasException) return CustomerModel.fromJson(result.data['viewer']);
    } catch (e) {
      throw Exception(Strings.networkError);
    }
  }

  static String customerData() {
    return r'''
  query {
    viewer {
      id
      name
      balance
      offers {
        id
        price
        product {
          id
          name
          description
          image
        }
      }
    }
  }
  ''';
  }
}
