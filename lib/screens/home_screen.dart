import 'package:flutter/material.dart';
import 'package:flutter_mart/models/product.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final product = productProvider.products;
    return Scaffold(
      appBar: AppBar(title: Text('FlutterMart')),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return ProductCard(product: product[index]);
        },
      ), // kamu yang isi
    );
  }
}
