import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';

abstract class HomeRepo{
  Future<List<CoinEntity>> getCoins();
  Future<List<FavoriteCoinEntity>> getFavoriteCoins();
  Future<int> addCoinToFavorite(AddCoinToFavoriteParam param);
  Future<void> deleteCoinFromFavorite(DeleteCoinFromFavoriteParam param);
}