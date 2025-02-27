// To parse this JSON data, do
//
//     final apiError = apiErrorFromJson(jsonString);

import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  String? code;
  String? message;
  String? payload;

  ApiError({
    this.code,
    this.message,
    this.payload,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    code: json["code"],
    message: json["message"],
    payload: json["payload"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "payload": payload,
  };
}
