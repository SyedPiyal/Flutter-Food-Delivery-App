import 'package:flutter/material.dart';
import 'package:food_app/core/dataModel/login/login_response.dart';
import '../data/auth/login_repo.dart';
import '../dataModel/login/login_req.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _loginRepository = LoginRepository();



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
      return loginResponse;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
