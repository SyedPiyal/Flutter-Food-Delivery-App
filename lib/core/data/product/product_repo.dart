

import '../../../utils/api_consts.dart';
import '../../dataModel/product/popular_product.dart';
import '../../network/api_client.dart';

class PopularProductRepository {
  final ApiClient _apiService;

  PopularProductRepository(String baseUrl) : _apiService = ApiClient(baseUrl);

  Future<PopularProduct> fetchPopularProducts() async {
    try {
      final response = await _apiService.get(AppApiConstants.popularProduct);
      return PopularProduct.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load popular products: $e');
    }
  }
}
