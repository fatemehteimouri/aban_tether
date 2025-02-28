// To parse this JSON data, do
//
//     final changeFavoriteCoinStateParam = changeFavoriteCoinStateParamFromJson(jsonString);

import 'dart:convert';

ChangeFavoriteCoinStateParam changeFavoriteCoinStateParamFromJson(String str) => ChangeFavoriteCoinStateParam.fromJson(json.decode(str));

String changeFavoriteCoinStateParamToJson(ChangeFavoriteCoinStateParam data) => json.encode(data.toJson());

class ChangeFavoriteCoinStateParam {
  final int? id;
  final bool? isFavorite;

  const ChangeFavoriteCoinStateParam({
    this.id,
    this.isFavorite,
  });

  ChangeFavoriteCoinStateParam copyWith({
    int? id,
    bool? isFavorite,
  }) =>
      ChangeFavoriteCoinStateParam(
        id: id ?? this.id,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  factory ChangeFavoriteCoinStateParam.fromJson(Map<String, dynamic> json) => ChangeFavoriteCoinStateParam(
    id: json["id"],
    isFavorite: json["isFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isFavorite": isFavorite,
  };
}
