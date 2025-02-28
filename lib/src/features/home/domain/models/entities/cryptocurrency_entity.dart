// To parse this JSON data, do
//
//     final cryptoCurrencyEntity = cryptoCurrencyEntityFromJson(jsonString);


class CryptoCurrencyEntity {
  int? id;
  String? createdAt;
  String? name;
  int? price;
  String? symbol;
  String? iconAddress;
  bool? isFavorite;

  CryptoCurrencyEntity({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.symbol,
    this.iconAddress,
    this.isFavorite,
  });

  CryptoCurrencyEntity copyWith({
    int? id,
    String? createdAt,
    String? name,
    int? price,
    String? symbol,
    String? iconAddress,
    bool? isFavorite,
  }) =>
      CryptoCurrencyEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        price: price ?? this.price,
        symbol: symbol ?? this.symbol,
        iconAddress: iconAddress ?? this.iconAddress,
        isFavorite: isFavorite ?? this.isFavorite,
      );

}
