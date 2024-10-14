import 'package:food_app/core/data/auth/login_repo.dart';
import 'package:food_app/core/dataModel/login/login_req.dart';
import 'package:food_app/core/dataModel/login/login_response.dart';
import '../../../utils/api_consts.dart';

class LoginRepoImpl extends LoginRepository {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await apiService.post(
        AppApiConstants.loginUrl,
        data: loginRequest.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
