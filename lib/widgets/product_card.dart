import 'package:flutter/material.dart';
import 'package:flutter_mart/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 700,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        children: [
          Image.network(product.imageUrl),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Rp ${product.price.toStringAsFixed(0)}',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Add To Cart'),
            icon: Icon(Icons.trolley),
          ),
        ],
      ),
    );
  }
}
