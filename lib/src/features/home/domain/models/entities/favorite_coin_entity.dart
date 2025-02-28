
class FavoriteCoinEntity {
  final int? id;
  final String? createdAt;
  final int? userId;
  final int? cryptocurrencyId;
  final int? favoriteId;

  FavoriteCoinEntity({
    this.id,
    this.createdAt,
    this.userId,
    this.cryptocurrencyId,
    this.favoriteId,
  });

  FavoriteCoinEntity copyWith({
    int? id,
    String? createdAt,
    int? userId,
    int? cryptocurrencyId,
    int? favoriteId,
  }) =>
      FavoriteCoinEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        cryptocurrencyId: cryptocurrencyId ?? this.cryptocurrencyId,
        favoriteId: favoriteId ?? this.favoriteId,
      );

}
