// To parse this JSON data, do
//
//     final cryptoCurrencyEntity = cryptoCurrencyEntityFromJson(jsonString);


class CoinEntity {
  int? id;
  String? createdAt;
  String? name;
  int? price;
  String? symbol;
  String? iconAddress;
  bool? isFavorite;
  int? favoriteId;

  CoinEntity({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.symbol,
    this.iconAddress,
    this.isFavorite,
    this.favoriteId,
  });

  CoinEntity copyWith({
    int? id,
    String? createdAt,
    String? name,
    int? price,
    String? symbol,
    String? iconAddress,
    bool? isFavorite,
    int? favoriteId,
  }) =>
      CoinEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        price: price ?? this.price,
        symbol: symbol ?? this.symbol,
        iconAddress: iconAddress ?? this.iconAddress,
        isFavorite: isFavorite ?? this.isFavorite,
        favoriteId: favoriteId ?? this.favoriteId,
      );

}
