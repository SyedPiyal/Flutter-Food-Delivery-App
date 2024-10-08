import '../../../utils/api_consts.dart';
import '../../dataModel/login/login_req.dart';
import '../../dataModel/login/login_response.dart';
import '../../network/api_client.dart';

class LoginRepository {
  final ApiClient _apiService;

  LoginRepository(String baseUrl) : _apiService = ApiClient(baseUrl);

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.post(AppApiConstants.loginUrl,
          data: loginRequest.toJson());
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
