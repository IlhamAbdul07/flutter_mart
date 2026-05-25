import 'package:flutter/material.dart';
import 'package:flutter_mart/models/cart_item.dart';
import 'package:flutter_mart/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;
  void addItem(Product product) {
    // terima product dari luar
    final cartItem = CartItem(productType: product, quantity: 1);
    // buat CartItem baru dari product itu
    _cart.add(cartItem);
    // masukkan ke _cart
    notifyListeners();
    // beritahu widget
  }

  void removeItem(Product product) {
    // hapus CartItem yang productType-nya sama dengan product ini
    _cart.removeWhere((item) => item.productType == product);
    // beritahu widget
    notifyListeners();
  }
}
