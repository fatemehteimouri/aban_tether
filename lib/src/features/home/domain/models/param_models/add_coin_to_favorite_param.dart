// To parse this JSON data, do
//
//     final addCoinToFavoriteParam = addCoinToFavoriteParamFromJson(jsonString);

import 'dart:convert';

AddCoinToFavoriteParam addCoinToFavoriteParamFromJson(String str) => AddCoinToFavoriteParam.fromJson(json.decode(str));

String addCoinToFavoriteParamToJson(AddCoinToFavoriteParam data) => json.encode(data.toJson());

class AddCoinToFavoriteParam {
  final int? id;

  AddCoinToFavoriteParam({
    this.id,
  });

  AddCoinToFavoriteParam copyWith({
    int? id,
  }) =>
      AddCoinToFavoriteParam(
        id: id ?? this.id,
      );

  factory AddCoinToFavoriteParam.fromJson(Map<String, dynamic> json) => AddCoinToFavoriteParam(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
