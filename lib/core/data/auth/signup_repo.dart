import 'package:food_app/core/dataModel/signup/signup_request.dart';
import 'package:food_app/core/dataModel/signup/signup_response.dart';

import '../../../utils/api_consts.dart';
import '../../network/api_client.dart';

class SignUpRepository {
  final ApiClient _apiService;

  SignUpRepository(String baseUrl) : _apiService = ApiClient(baseUrl);

  Future<SignupResponse> signUp(SignupRequest signupRequest) async {
    try {
      final response = await _apiService.post(AppApiConstants.registerUrl,
          data: signupRequest.toJson());
      return SignupResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
