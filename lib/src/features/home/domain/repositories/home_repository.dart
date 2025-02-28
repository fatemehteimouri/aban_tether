import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/change_crypto_favorite_state_param.dart';

abstract class HomeRepo{
  Future<List<CoinEntity>> getAllCoins();
  Future<List<FavoriteCoinEntity>> getFavoriteCoins();
  Future<void> addCoinToFavorite(ChangeFavoriteCoinStateParam param);
  Future<void> deleteCoinFromFavorite(ChangeFavoriteCoinStateParam param);
}