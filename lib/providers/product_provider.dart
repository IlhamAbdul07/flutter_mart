import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mart/models/product.dart';
import 'package:flutter_mart/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage = null;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Product> get products => _products;

  Future<void> loadProduct() async {
    try {
      _isLoading = true;
      notifyListeners();
      _products = await _productRepository.getProducts();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionError:
            _errorMessage = "Tidak ada koneksi internet";
          case DioExceptionType.connectionTimeout:
            _errorMessage = "Koneksi timeout, coba lagi";
          case DioExceptionType.badResponse:
            _errorMessage = "Server error: ${e.response?.statusCode}";
            break;
          default:
            _errorMessage = "Gagal Memuat Produk";
        }
      }
      _isLoading = false;
      notifyListeners();
    }
  }
}
