import 'package:flutter/material.dart';
import 'package:flutter_mart/models/product.dart';
import 'package:flutter_mart/providers/cart_provider.dart';
import 'package:flutter_mart/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                product.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Rp ${product.price.toStringAsFixed(0)}',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<CartProvider>().addItem(product);
                },
                label: Text('Add To Cart'),
                icon: Icon(Icons.trolley),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
