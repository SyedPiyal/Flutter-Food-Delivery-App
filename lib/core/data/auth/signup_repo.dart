import 'package:food_app/core/dataModel/signup/signup_request.dart';
import 'package:food_app/core/dataModel/signup/signup_response.dart';
import '../../network/api_client.dart';
import '../../service/service_locator.dart';

abstract class SignUpRepository {
  final ApiClient apiService = di.get<ApiClient>();

  Future<SignupResponse> signUp(SignupRequest signupRequest) ;
}
