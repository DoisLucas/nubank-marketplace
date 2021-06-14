import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MarketplacePage extends StatefulWidget {
  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
