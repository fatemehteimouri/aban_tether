// To parse this JSON data, do
//
//     final meResponse = meResponseFromJson(jsonString);

import 'dart:convert';

MeResponse meResponseFromJson(String str) => MeResponse.fromJson(json.decode(str));

String meResponseToJson(MeResponse data) => json.encode(data.toJson());

class MeResponse {
  int? id;
  String? createdAt;
  String? name;
  String? email;

  MeResponse({
    this.id,
    this.createdAt,
    this.name,
    this.email,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) => MeResponse(
    id: json["id"],
    createdAt: json["created_at"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "name": name,
    "email": email,
  };
}
