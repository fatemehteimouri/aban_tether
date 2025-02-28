// To parse this JSON data, do
//
//     final cryptoCurrencyResponse = cryptoCurrencyResponseFromJson(jsonString);

import 'dart:convert';

CryptoCurrencyResponse cryptoCurrencyResponseFromJson(String str) => CryptoCurrencyResponse.fromJson(json.decode(str));

String cryptoCurrencyResponseToJson(CryptoCurrencyResponse data) => json.encode(data.toJson());

class CryptoCurrencyResponse {
  int? id;
  String? createdAt;
  String? name;
  int? price;
  String? symbol;
  String? iconAddress;
  bool? isFavorite;

  CryptoCurrencyResponse({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.symbol,
    this.iconAddress,
    this.isFavorite,
  });

  CryptoCurrencyResponse copyWith({
    int? id,
    String? createdAt,
    String? name,
    int? price,
    String? symbol,
    String? iconAddress,
    bool? isFavorite,
  }) =>
      CryptoCurrencyResponse(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        price: price ?? this.price,
        symbol: symbol ?? this.symbol,
        iconAddress: iconAddress ?? this.iconAddress,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  factory CryptoCurrencyResponse.fromJson(Map<String, dynamic> json) => CryptoCurrencyResponse(
    id: json["id"],
    createdAt: json["created_at"],
    name: json["name"],
    price: json["price"],
    symbol: json["symbol"],
    iconAddress: json["icon_address"],
    isFavorite: json["is_favorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "name": name,
    "price": price,
    "symbol": symbol,
    "icon_address": iconAddress,
    "is_favorite": isFavorite,
  };
}
