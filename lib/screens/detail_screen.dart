import 'package:flutter/material.dart';
import 'package:flutter_mart/models/product.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Image.network(product.imageUrl),
            const SizedBox(height: 16),
            Text(product.name),
            const SizedBox(height: 16),
            Text(product.category),
            const SizedBox(height: 16),
            Text(product.price.toStringAsFixed(0)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
