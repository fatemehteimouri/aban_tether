import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/data_source/crypto_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/data_source/favorites_remote_datasource.dart';
import 'package:aban_tether/src/features/home/data/mapper/add_coin_to_favorite_param_ext.dart';
import 'package:aban_tether/src/features/home/data/mapper/cryptocurrency_response_ext.dart';
import 'package:aban_tether/src/features/home/data/mapper/delete_coin_from_favorite_param_ext.dart';
import 'package:aban_tether/src/features/home/data/mapper/get_favorite_coins_response_ext.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class HomeRepoImpl extends HomeRepo {
  final CryptoRemoteDatasource cryptoRemoteDatasource;
  final FavoriteRemoteDatasource favoriteRemoteDatasource;

  HomeRepoImpl(
      {required this.cryptoRemoteDatasource,
      required this.favoriteRemoteDatasource});

  @override
  Future<List<CoinEntity>> getCoins() async {
    try {
      final response = await cryptoRemoteDatasource.getCryptoCurrencies();
      return response.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FavoriteCoinEntity>> getFavoriteCoins() async {
    try {
      final response = await favoriteRemoteDatasource.getFavoriteCoins();
      return (response)
          .map(
            (e) => e.toEntity(),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addCoinToFavorite(AddCoinToFavoriteParam param) async {
    try {
      final response =
          await favoriteRemoteDatasource.addCoinToFavorite(param.toRequest());
      return response.id!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCoinFromFavorite(DeleteCoinFromFavoriteParam param) async {
    try {
      await favoriteRemoteDatasource.deleteCoinFromFavorite(param.toRequest());
    } catch (e) {
      rethrow;
    }
  }
}
