import 'package:flutter_mart/models/product.dart';

class CartItem {
  final Product productType;
  final int quantity;

  CartItem({required this.productType, required this.quantity});

  double get subtotal => productType.price * quantity;
}
