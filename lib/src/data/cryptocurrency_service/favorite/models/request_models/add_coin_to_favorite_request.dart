// To parse this JSON data, do
//
//     final addCoinToFavoriteRequest = addCoinToFavoriteRequestFromJson(jsonString);

import 'dart:convert';

AddCoinToFavoriteRequest addCoinToFavoriteRequestFromJson(String str) => AddCoinToFavoriteRequest.fromJson(json.decode(str));

String addCoinToFavoriteRequestToJson(AddCoinToFavoriteRequest data) => json.encode(data.toJson());

class AddCoinToFavoriteRequest {
  int? cryptocurrencyId;

  AddCoinToFavoriteRequest({
    this.cryptocurrencyId,
  });

  AddCoinToFavoriteRequest copyWith({
    int? cryptocurrencyId,
  }) =>
      AddCoinToFavoriteRequest(
        cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
      );

  factory AddCoinToFavoriteRequest.fromJson(Map<String, dynamic> json) => AddCoinToFavoriteRequest(
    cryptocurrencyId: json["cryptocurrency_id"],
  );

  Map<String, dynamic> toJson() => {
    "cryptocurrency_id": cryptocurrencyId,
  };
}
