import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tyreplex_demo/core/constants/api_constants.dart';
import '../models/product_model.dart';

class ApiService {
  static const String _url = ApiConstants.baseURL;

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      final List productsList = decoded['products'];

      return productsList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}