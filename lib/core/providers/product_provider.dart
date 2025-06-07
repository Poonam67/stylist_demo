import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  bool _loading = true;
  String? _error;

  bool get loading => _loading;
  String? get error => _error;

  final ApiService _api = ApiService();

  Future<void> fetchProducts() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _products = await _api.fetchProducts();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
