import 'package:flutter/material.dart';

import '../data/product/product_repo.dart';
import '../dataModel/product/popular_product.dart';


class PopularProductProvider with ChangeNotifier {
  final PopularProductRepository _repository = PopularProductRepository();


  bool _isLoading = false;
  String? _errorMessage;
  PopularProduct? _popularProducts;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  PopularProduct? get popularProducts => _popularProducts;

  Future<void> fetchPopularProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _popularProducts = await _repository.fetchPopularProducts();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
