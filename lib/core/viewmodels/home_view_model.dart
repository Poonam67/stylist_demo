import 'package:tyreplex_demo/core/services/api_service.dart';
import 'package:tyreplex_demo/core/viewmodels/base_model.dart';

import '../di/locator.dart';
import '../enums/view_state.dart';
import '../models/product_model.dart';

class HomeViewModel extends BaseModel{
  final ApiService _apiService = locator<ApiService>();

  List<Product> _products = [];
  List<Product> get products => _products;
  bool _loading = true;
  String? _error;

  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _loading = true;
    _error = null;
      state = ViewState.busy;
    try {
      _products = await _apiService.fetchProducts();
      updateUI();
      state = ViewState.idle;
    } catch (e) {
      _error = e.toString();
      state = ViewState.idle;
    } finally {
      _loading = false;
      updateUI();
      state = ViewState.idle;
    }
  }
}