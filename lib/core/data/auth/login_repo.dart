import '../../dataModel/login/login_req.dart';
import '../../dataModel/login/login_response.dart';
import '../../network/api_client.dart';
import '../../service/service_locator.dart';

abstract class LoginRepository {
  final ApiClient apiService = di.get<ApiClient>();

  Future<LoginResponse> login(LoginRequest loginRequest);
}
