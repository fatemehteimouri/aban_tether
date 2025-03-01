// To parse this JSON data, do
//
//     final cryptoCurrencyEntity = cryptoCurrencyEntityFromJson(jsonString);


import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable{
   int? id;
   int? createdAt;
   String? name;
   double? price;
   String? symbol;
   String? iconAddress;
   bool isFavorite;
   int? favoriteId;

   CoinEntity({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.symbol,
    this.iconAddress,
    this.isFavorite = false,
    this.favoriteId,
  });

  CoinEntity copyWith({
    int? id,
    int? createdAt,
    String? name,
    double? price,
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

  @override
  // TODO: implement props
  List<Object?> get props => [id,isFavorite,favoriteId];

}
