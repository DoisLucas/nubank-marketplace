import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_marketplace/commons/theme.dart';
import 'package:nubank_marketplace/presenter/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Nubank',
      theme: NuTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
