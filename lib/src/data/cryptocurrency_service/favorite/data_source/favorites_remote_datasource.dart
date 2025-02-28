import 'package:aban_tether/src/data/cryptocurrency_service/favorite/constants/api_routes.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/request_models/add_coin_to_favorite_request.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/request_models/delete_coin_from_favorite_request.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/response_models/add_coin_to_favorite_response.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/response_models/get_favorite_coin_response.dart';
import 'package:dio/dio.dart';

class FavoriteRemoteDatasource {
  final Dio dio;

  const FavoriteRemoteDatasource({required this.dio});

  Future<AddCoinToFavoriteResponse> addCoinToFavorite(
      AddCoinToFavoriteRequest request) {
    return dio.post(favoriteControllerName, data: request.toJson()).then(
          (response) => AddCoinToFavoriteResponse.fromJson(response.data),
        );
  }

  Future<void> deleteCoinFromFavorite(DeleteCoinFromFavoriteRequest request) {
    return dio.delete(favoriteControllerName, data: request.toJson());
  }

  Future<List<GetFavoriteCoinResponse>> getFavoriteCoins() {
    return dio.get(favoriteControllerName).then(
          (response) => (response.data as List)
              .map(
                (e) => GetFavoriteCoinResponse.fromJson(e),
              )
              .toList(),
        );
  }
}
