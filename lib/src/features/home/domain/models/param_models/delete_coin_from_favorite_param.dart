// To parse this JSON data, do
//
//     final deleteCoinFromFavoriteParam = deleteCoinFromFavoriteParamFromJson(jsonString);

import 'dart:convert';

DeleteCoinFromFavoriteParam deleteCoinFromFavoriteParamFromJson(String str) => DeleteCoinFromFavoriteParam.fromJson(json.decode(str));

String deleteCoinFromFavoriteParamToJson(DeleteCoinFromFavoriteParam data) => json.encode(data.toJson());

class DeleteCoinFromFavoriteParam {
  final int? favoritesId;

  DeleteCoinFromFavoriteParam({
    this.favoritesId,
  });

  DeleteCoinFromFavoriteParam copyWith({
    int? favoritesId,
  }) =>
      DeleteCoinFromFavoriteParam(
        favoritesId: favoritesId ?? this.favoritesId,
      );

  factory DeleteCoinFromFavoriteParam.fromJson(Map<String, dynamic> json) => DeleteCoinFromFavoriteParam(
    favoritesId: json["favorites_id"],
  );

  Map<String, dynamic> toJson() => {
    "favorites_id": favoritesId,
  };
}
