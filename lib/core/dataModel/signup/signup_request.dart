// To parse this JSON data, do
//
//     final registrationRequest = registrationRequestFromJson(jsonString);

import 'dart:convert';

SignupRequest registrationRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String registrationRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  String? fName;
  String? phone;
  String? email;
  String? password;

  SignupRequest({
    this.fName,
    this.phone,
    this.email,
    this.password,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
    fName: json["f_name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "f_name": fName,
    "phone": phone,
    "email": email,
    "password": password,
  };
}
