// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);

import 'dart:convert';

SignupResponse registrationResponseFromJson(String str) => SignupResponse.fromJson(json.decode(str));

String registrationResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  String? token;
  int? isPhoneVerified;
  String? phoneVerifyEndUrl;

  SignupResponse({
    this.token,
    this.isPhoneVerified,
    this.phoneVerifyEndUrl,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
    token: json["token"],
    isPhoneVerified: json["is_phone_verified"],
    phoneVerifyEndUrl: json["phone_verify_end_url"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "is_phone_verified": isPhoneVerified,
    "phone_verify_end_url": phoneVerifyEndUrl,
  };
}
