abstract class GraphqlClient {
  Future<dynamic> query({required String query});
  Future<dynamic> mutate({required String query});
}
