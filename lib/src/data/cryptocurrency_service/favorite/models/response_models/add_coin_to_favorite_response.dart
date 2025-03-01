// To parse this JSON data, do
//
//     final addCoinToFavoriteResponse = addCoinToFavoriteResponseFromJson(jsonString);

import 'dart:convert';

AddCoinToFavoriteResponse addCoinToFavoriteResponseFromJson(String str) => AddCoinToFavoriteResponse.fromJson(json.decode(str));

String addCoinToFavoriteResponseToJson(AddCoinToFavoriteResponse data) => json.encode(data.toJson());

class AddCoinToFavoriteResponse {
  int? id;
  int? createdAt;
  int? userId;
  int? cryptocurrencyId;

  AddCoinToFavoriteResponse({
    this.id,
    this.createdAt,
    this.userId,
    this.cryptocurrencyId,
  });

  AddCoinToFavoriteResponse copyWith({
    int? id,
    int? createdAt,
    int? userId,
    int? cryptocurrencyId,
  }) =>
      AddCoinToFavoriteResponse(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
      );

  factory AddCoinToFavoriteResponse.fromJson(Map<String, dynamic> json) => AddCoinToFavoriteResponse(
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
