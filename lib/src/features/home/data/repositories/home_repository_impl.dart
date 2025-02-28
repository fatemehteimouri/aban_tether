import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/data_source/crypto_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/data_source/favorite_remote_datasource.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/cryptocurrency_entity.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class HomeRepoImpl extends HomeRepo{
  final CryptoRemoteDatasource cryptoRemoteDatasource;
  final FavoriteRemoteDatasource favoriteRemoteDatasource;

  HomeRepoImpl({required this.cryptoRemoteDatasource, required this.favoriteRemoteDatasource});

  @override
  Future<CryptoCurrencyEntity> getCryptoCurrencies() {
    // TODO: implement getCryptoCurrencies
    throw UnimplementedError();
  }

  @override
  Future<CryptoCurrencyEntity> addToFavorite() {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<CryptoCurrencyEntity> remoteFromFavorite() {
    // TODO: implement remoteFromFavorite
    throw UnimplementedError();
  }
}