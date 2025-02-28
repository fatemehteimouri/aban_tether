import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/data_source/crypto_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/data_source/favorites_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/response_models/get_favorite_coin_response.dart';
import 'package:aban_tether/src/features/home/data/mapper/add_coin_to_favorite_param_ext.dart';
import 'package:aban_tether/src/features/home/data/mapper/cryptocurrency_response_ext.dart';
import 'package:aban_tether/src/features/home/data/mapper/delete_coin_from_favorite_param_ext.dart';
import 'package:aban_tether/src/features/home/data/mapper/get_favorite_coins_response_ext.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class HomeRepoImpl extends HomeRepo{
  final CryptoRemoteDatasource cryptoRemoteDatasource;
  final FavoriteRemoteDatasource favoriteRemoteDatasource;

  HomeRepoImpl({required this.cryptoRemoteDatasource, required this.favoriteRemoteDatasource});


  @override
  Future<List<CoinEntity>> getAllCoins() {
    return cryptoRemoteDatasource.getCryptoCurrencies().then((response) => response.map((e) => e.toEntity()).toList(),);
  }

  @override
  Future<List<FavoriteCoinEntity>> getFavoriteCoins() {
    return favoriteRemoteDatasource.getFavoriteCoins().then((response) => (response).map((e) => e.toEntity(),).toList(),);
  }

  @override
  Future<int> addCoinToFavorite(AddCoinToFavoriteParam param) {
    return favoriteRemoteDatasource.addCoinToFavorite(param.toRequest()).then((response) => response.id!,);
  }

  @override
  Future<void> deleteCoinFromFavorite(DeleteCoinFromFavoriteParam param) {
    return favoriteRemoteDatasource.deleteCoinFromFavorite(param.toRequest());

  }


}