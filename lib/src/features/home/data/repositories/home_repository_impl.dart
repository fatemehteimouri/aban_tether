import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/data_source/crypto_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/data_source/favorites_remote_datasource.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/change_crypto_favorite_state_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class HomeRepoImpl extends HomeRepo{
  final CryptoRemoteDatasource cryptoRemoteDatasource;
  final FavoriteRemoteDatasource favoriteRemoteDatasource;

  HomeRepoImpl({required this.cryptoRemoteDatasource, required this.favoriteRemoteDatasource});

  @override
  Future<void> addCoinToFavorite(ChangeFavoriteCoinStateParam param) {
    // TODO: implement addCoinToFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCoinFromFavorite(ChangeFavoriteCoinStateParam param) {
    // TODO: implement deleteCoinFromFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<CoinEntity>> getAllCoins() {
    // TODO: implement getAllCoins
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteCoinEntity>> getFavoriteCoins() {
    // TODO: implement getFavoriteCoins
    throw UnimplementedError();
  }


}