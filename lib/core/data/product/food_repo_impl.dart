import 'package:food_app/core/data/product/food_repo.dart';
import 'package:food_app/core/dataModel/product/popular_product.dart';
import 'package:food_app/core/dataModel/product/recommended_product.dart';
import '../../../utils/api_consts.dart';

class FoodRepoImpl extends FoodRepository {
  @override
  Future<PopularProduct> fetchPopularFoods() async {
    try {
      final response = await apiService.get(AppApiConstants.popularProduct);
      return PopularProduct.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load popular products: $e');
    }
  }

  @override
  Future<RecommenderProduct> fetchRecommendedFoods() async {
    try {
      final response = await apiService.get(AppApiConstants.recommendedProduct);
      return RecommenderProduct.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load popular products: $e');
    }
  }
}
