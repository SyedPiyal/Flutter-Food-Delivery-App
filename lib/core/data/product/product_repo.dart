import 'package:food_app/core/dataModel/product/recommended_product.dart';

import '../../../utils/api_consts.dart';
import '../../dataModel/product/popular_product.dart';
import '../../network/api_client.dart';

class FoodRepository {
  final ApiClient _apiService = ApiClient();

  // popular product list
  Future<PopularProduct> fetchPopularFoods() async {
    try {
      final response = await _apiService.get(AppApiConstants.popularProduct);
      return PopularProduct.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load popular products: $e');
    }
  }

  // recommender product list

  Future<RecommenderProduct> fetchRecommendedFoods() async {
    try {
      final response =
          await _apiService.get(AppApiConstants.recommendedProduct);
      return RecommenderProduct.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load popular products: $e');
    }
  }
}
