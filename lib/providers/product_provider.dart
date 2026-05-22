import 'package:flutter/material.dart';
import 'package:flutter_mart/models/product.dart';
import 'package:flutter_mart/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();
  List<Product> _products = [];

  List<Product> get products => _products;

  void LoadProduct() {
    _products = _productRepository.getProducts();
    notifyListeners();
  }
}
