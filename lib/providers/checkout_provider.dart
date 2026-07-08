import 'package:flutter/material.dart';
import 'package:flutter_mart/models/cart_item.dart';
import 'package:flutter_mart/models/checkout.dart';

class CheckoutProvider extends ChangeNotifier {
  Checkout? _checkout;
  String _name = '';
  String _address = '';
  String _phone = '';
  String _promo = '';
  String _paymentMethod = '';

  String get name => _name;
  String get address => _address;
  String get phone => _phone;
  String get promo => _promo;
  String get paymentMethod => _paymentMethod;
  Checkout? get checkout => _checkout;

  void submitCheckout(List<CartItem> cartItems) {
    _checkout = Checkout(
      productCart: cartItems,
      name: name,
      address: address,
      phone: phone,
      promo: promo,
      paymentMethod: paymentMethod,
    );

    notifyListeners();
  }

  void setField(String field, String value) {
    switch (field) {
      case "name":
        _name = value;
        break;
      case "address":
        _address = value;
        break;
      case "phone":
        _phone = value;
        break;
      case "promo":
        _promo = value;
        break;
      case "paymentMethod":
        _paymentMethod = value;
        break;
      default:
    }
    notifyListeners();
  }
}
