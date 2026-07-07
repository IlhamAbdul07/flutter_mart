import 'package:flutter_mart/models/cart_item.dart';

class Checkout {
  final List<CartItem> productCart;
  final String name;
  final String address;
  final String phone;
  final String promo;
  final String paymentMethod;

  Checkout({
    required this.productCart,
    required this.name,
    required this.address,
    required this.phone,
    required this.promo,
    required this.paymentMethod,
  });
}
