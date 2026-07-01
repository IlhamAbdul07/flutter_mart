import 'package:flutter/material.dart';
import 'package:flutter_mart/models/cart_item.dart';
import 'package:flutter_mart/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;
  int get totalItem => _cart.length;
  double get totalPrice =>
      _cart.fold(0.0, (total, item) => total + item.subtotal);
  void addItem(Product product) {
    // terima product dari luar
    final index = _cart.indexWhere((item) => item.productType == product);
    // buat CartItem baru dari product itu
    if (index >= 0) {
      _cart[index] = CartItem(
        productType: product,
        quantity: _cart[index].quantity + 1,
      );
    } else {
      _cart.add(CartItem(productType: product, quantity: 1));
    }

    // masukkan ke _cart
    notifyListeners();
    // beritahu widget
  }

  void decreaseItem(Product product) {
    final index = _cart.indexWhere((item) => item.productType == product);

    if (index >= 0) {
      if (_cart[index].quantity > 1) {
        _cart[index] = CartItem(
          productType: product,
          quantity: _cart[index].quantity - 1,
        );
      } else {
        removeItem(product);
      }
    }

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
