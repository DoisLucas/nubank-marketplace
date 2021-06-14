import 'package:nubank_marketplace/data/graphql/graphql.dart';
import 'package:nubank_marketplace/data/models/models.dart';
import 'package:nubank_marketplace/domain/entities/entities.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';

class GetCustomerDataGraphql implements GetCustomerData {
  final GraphqlClient graphqlClient;

  GetCustomerDataGraphql({required this.graphqlClient});

  @override
  Future<Customer> getCustomerData() async {
    final result = await graphqlClient.query(query: customerData());
    if (result.hasException) throw Exception('Error on getCustomerData query');
    return CustomerModel.fromJson(result.data['viewer']);
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
