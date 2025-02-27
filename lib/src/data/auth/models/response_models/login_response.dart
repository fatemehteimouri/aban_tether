// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? authToken;

  LoginResponse({
    this.authToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    authToken: json["authToken"],
  );

  Map<String, dynamic> toJson() => {
    "authToken": authToken,
  };
}
