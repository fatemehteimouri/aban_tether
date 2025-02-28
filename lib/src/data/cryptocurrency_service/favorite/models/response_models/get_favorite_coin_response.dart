// To parse this JSON data, do
//
//     final getFavoriteCoinResponse = getFavoriteCoinResponseFromJson(jsonString);

import 'dart:convert';

GetFavoriteCoinResponse getFavoriteCoinResponseFromJson(String str) => GetFavoriteCoinResponse.fromJson(json.decode(str));

String getFavoriteCoinResponseToJson(GetFavoriteCoinResponse data) => json.encode(data.toJson());

class GetFavoriteCoinResponse {
  int? id;
  String? createdAt;
  int? userId;
  int? cryptocurrencyId;

  GetFavoriteCoinResponse({
    this.id,
    this.createdAt,
    this.userId,
    this.cryptocurrencyId,
  });

  GetFavoriteCoinResponse copyWith({
    int? id,
    String? createdAt,
    int? userId,
    int? cryptocurrencyId,
  }) =>
      GetFavoriteCoinResponse(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
      );

  factory GetFavoriteCoinResponse.fromJson(Map<String, dynamic> json) => GetFavoriteCoinResponse(
    id: json["id"],
    createdAt: json["created_at"],
    userId: json["user_id"],
    cryptocurrencyId: json["cryptocurrency_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "user_id": userId,
    "cryptocurrency_id": cryptocurrencyId,
  };
}
