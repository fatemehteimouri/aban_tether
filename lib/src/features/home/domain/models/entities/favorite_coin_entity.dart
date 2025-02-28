// To parse this JSON data, do
//
//     final favoriteCoinEntity = favoriteCoinEntityFromJson(jsonString);

import 'dart:convert';

FavoriteCoinEntity favoriteCoinEntityFromJson(String str) => FavoriteCoinEntity.fromJson(json.decode(str));

String favoriteCoinEntityToJson(FavoriteCoinEntity data) => json.encode(data.toJson());

class FavoriteCoinEntity {
  final int? id;
  final String? createdAt;
  final int? userId;
  final int? cryptocurrencyId;

  FavoriteCoinEntity({
    this.id,
    this.createdAt,
    this.userId,
    this.cryptocurrencyId,
  });

  FavoriteCoinEntity copyWith({
    int? id,
    String? createdAt,
    int? userId,
    int? cryptocurrencyId,
  }) =>
      FavoriteCoinEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
      );

  factory FavoriteCoinEntity.fromJson(Map<String, dynamic> json) => FavoriteCoinEntity(
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
