import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductRepository {
  String baseUrl = 'https://fakestoreapi.com';
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    final response = await _dio.get('$baseUrl/products');
    final List data = response.data;
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
