import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nubank_marketplace/commons/theme.dart';
import 'package:nubank_marketplace/commons/utils.dart';
import 'package:nubank_marketplace/data/graphql/graphql.dart';
import 'package:nubank_marketplace/data/usecases/usecases.dart';
import 'package:nubank_marketplace/domain/usecases/usecases.dart';
import 'package:nubank_marketplace/infra/graphql/graphql.dart';
import 'package:nubank_marketplace/presenter/splash/splash_page.dart';

void main() {
  runFactories();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nubank',
      theme: NuTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

void runFactories() {
  //Graphql Client
  GraphqlClient graphqlClient = initGraphqlClient();

  //Usecases
  GetCustomerData getCustomerData = GetCustomerDataGraphql(graphqlClient: graphqlClient);
  Get.put(getCustomerData, tag: 'get_customer_data');

  MakePurchase makePurchase = MakePurchaseGraphql(graphqlClient: graphqlClient);
  Get.put(makePurchase, tag: 'make_purchase');
}

GraphqlClient initGraphqlClient() {
  const String token = String.fromEnvironment('URL_TOKEN');
  GraphqlClient graphqlClient = GraphqlClientImpl(url: Utils.getApiUrl(), token: token);
  return Get.put(graphqlClient, tag: 'graphql_client');
}
