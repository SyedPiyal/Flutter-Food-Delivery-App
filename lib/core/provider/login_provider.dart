import 'package:flutter/material.dart';
import 'package:food_app/core/dataModel/login/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/auth/login_repo.dart';
import '../data/auth/signup_repo.dart';
import '../dataModel/login/login_req.dart';
import '../dataModel/signup/signup_request.dart';
import '../dataModel/signup/signup_response.dart';
import '../service/service_locator.dart';

class AuthProvider with ChangeNotifier {
  final LoginRepository _loginRepository = di.get<LoginRepository>();
  final SignUpRepository _signUpRepository = di.get<SignUpRepository>();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    _isLoading = true;
    notifyListeners();

    try {
      final LoginResponse loginResponse =
          await _loginRepository.login(loginRequest);
      _errorMessage = null; // Reset error message on success

      // Save login status
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      return loginResponse;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<SignupResponse?> signUp(SignupRequest signupRequest) async {
    _isLoading = true;
    notifyListeners();

    try {
      final SignupResponse signupResponse =
          await _signUpRepository.signUp(signupRequest);
      _errorMessage = null; // Reset error message on success
      return signupResponse;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
