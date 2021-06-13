import 'package:nubank_marketplace/data/graphql/graphql.dart';
import 'package:graphql/client.dart';

class GraphqlClientImpl implements GraphqlClient {
  final String url;
  final String token;

  late HttpLink _httpLink;
  late AuthLink _authLink;
  late GraphQLClient _client;

  GraphqlClientImpl({required this.url, required this.token}) {
    _httpLink = HttpLink(url);
    _authLink = AuthLink(getToken: () async => 'Bearer $token');

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _authLink.concat(_httpLink),
    );
  }

  @override
  Future request({required String query}) async {
    final options = QueryOptions(document: gql(query));
    final result = await _client.query(options);
    return result;
  }
}
