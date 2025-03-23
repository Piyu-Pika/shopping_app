import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product_model.dart';

class ProductService {
  final String baseUrl = 'https://dummyjson.com';

  Future<ProductsResponse> getProducts({int limit = 10, int skip = 0}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/products?limit=$limit&skip=$skip'),
    );

    if (response.statusCode == 200) {
      return ProductsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProductDetails(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/$id'),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
