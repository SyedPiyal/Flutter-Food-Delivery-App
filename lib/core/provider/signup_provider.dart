import 'package:flutter/material.dart';
import 'package:food_app/core/data/auth/signup_repo.dart';
import 'package:food_app/core/dataModel/login/login_response.dart';
import 'package:food_app/core/dataModel/signup/signup_request.dart';
import 'package:food_app/core/dataModel/signup/signup_response.dart';
import '../data/auth/login_repo.dart';
import '../dataModel/login/login_req.dart';

class SignUpProvider with ChangeNotifier {
  final SignUpRepository _signUpRepository= SignUpRepository();


  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

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
