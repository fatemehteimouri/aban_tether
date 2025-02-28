// features/coin/domain/usecases/combine_coins_usecase.dart
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class CombineCoinsUseCase {
  final HomeRepo homeRepo;

  CombineCoinsUseCase({required this.homeRepo});

  Future<List<CoinEntity>> call() async {
    try {
      final coins = await homeRepo.getCoins();
      final favoriteCoins = await homeRepo.getFavoriteCoins();

      final Map<int, int> favoriteMap = {
        for (FavoriteCoinEntity fav in favoriteCoins)
          fav.cryptocurrencyId!: fav.id!,
      };

      final mergedCoins = coins.map((coin) {
        final favId = favoriteMap[coin.id];
        return CoinEntity(
          id: coin.id,
          name: coin.name,
          symbol: coin.symbol,
          iconAddress: coin.iconAddress,
          isFavorite: coin.isFavorite,
          createdAt: coin.createdAt,
          price: coin.price,
          favoriteId: favId,
        );
      }).toList();

      return mergedCoins;
    } catch (e) {
      rethrow;
    }
  }
}
