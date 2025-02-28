// To parse this JSON data, do
//
//     final deleteCoinFromFavoriteRequest = deleteCoinFromFavoriteRequestFromJson(jsonString);

import 'dart:convert';

DeleteCoinFromFavoriteRequest deleteCoinFromFavoriteRequestFromJson(String str) => DeleteCoinFromFavoriteRequest.fromJson(json.decode(str));

String deleteCoinFromFavoriteRequestToJson(DeleteCoinFromFavoriteRequest data) => json.encode(data.toJson());

class DeleteCoinFromFavoriteRequest {
  int? favoritesId;

  DeleteCoinFromFavoriteRequest({
    this.favoritesId,
  });

  DeleteCoinFromFavoriteRequest copyWith({
    int? favoritesId,
  }) =>
      DeleteCoinFromFavoriteRequest(
        favoritesId: favoritesId ?? this.favoritesId,
      );

  factory DeleteCoinFromFavoriteRequest.fromJson(Map<String, dynamic> json) => DeleteCoinFromFavoriteRequest(
    favoritesId: json["favorites_id "],
  );

  Map<String, dynamic> toJson() => {
    "favorites_id ": favoritesId,
  };
}
