import 'package:flutter/material.dart';
import 'package:food_app/core/dataModel/product/recommended_product.dart';

import '../data/product/product_repo.dart';
import '../dataModel/product/popular_product.dart';

class FoodProvider with ChangeNotifier {
  final FoodRepository _repository = FoodRepository();

  bool _isLoading = false;
  String? _errorMessage;
  PopularProduct? _popularProducts;
  RecommenderProduct? _recommenderProduct;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  PopularProduct? get popularProducts => _popularProducts;

  RecommenderProduct? get recommenderProduct => _recommenderProduct;

  // recommended food list
  Future<void> fetchRecommendedFoods() async {
    _isLoading = true;
    notifyListeners();

    try {
      _recommenderProduct = await _repository.fetchRecommendedFoods();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // popular food list

  Future<void> fetchPopularFoods() async {
    _isLoading = true;
    notifyListeners();

    try {
      _popularProducts = await _repository.fetchPopularFoods();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
