import 'package:food_app/core/dataModel/product/recommended_product.dart';
import '../../dataModel/product/popular_product.dart';
import '../../network/api_client.dart';
import '../../service/service_locator.dart';

abstract class FoodRepository {
  final ApiClient apiService = di.get<ApiClient>();

  // popular product list
  Future<PopularProduct> fetchPopularFoods();

  // recommender product list

  Future<RecommenderProduct> fetchRecommendedFoods();
}
