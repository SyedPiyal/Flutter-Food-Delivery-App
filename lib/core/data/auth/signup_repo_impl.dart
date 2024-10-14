import 'package:food_app/core/data/auth/signup_repo.dart';
import 'package:food_app/core/dataModel/signup/signup_request.dart';
import 'package:food_app/core/dataModel/signup/signup_response.dart';
import '../../../utils/api_consts.dart';

class SignupRepoImpl extends SignUpRepository {
  @override
  Future<SignupResponse> signUp(SignupRequest signupRequest) async {
    try {
      final response = await apiService.post(
        AppApiConstants.registerUrl,
        data: signupRequest.toJson(),
      );
      return SignupResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
