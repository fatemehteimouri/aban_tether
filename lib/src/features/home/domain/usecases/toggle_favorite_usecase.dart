import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class ToggleFavoriteUseCase {
  final HomeRepo homeRepo;

  ToggleFavoriteUseCase({required this.homeRepo});

  Future<CoinEntity> call(CoinEntity coin) async {
    try {
      if (coin.isFavorite) {
        await homeRepo.deleteCoinFromFavorite(
            DeleteCoinFromFavoriteParam(favoritesId: coin.favoriteId!));
        return coin.copyWith(
          isFavorite: false,
          favoriteId: null,
        );
      } else {
        final favoriteId = await homeRepo
            .addCoinToFavorite(AddCoinToFavoriteParam(id: coin.id));
        return coin.copyWith(
          isFavorite: true,
          favoriteId: favoriteId,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
