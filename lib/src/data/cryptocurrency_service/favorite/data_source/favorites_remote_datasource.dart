import 'package:aban_tether/src/core/network/error/api_error.dart';
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
      AddCoinToFavoriteRequest request) async {
    try{

      final response = await dio.post(favoriteControllerName, data: request.toJson());
      return AddCoinToFavoriteResponse.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }
  }

  Future<void> deleteCoinFromFavorite(DeleteCoinFromFavoriteRequest request) {
    try{
      return dio.delete(favoriteControllerName, data: request.toJson());
    }on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }

  }

  Future<List<GetFavoriteCoinResponse>> getFavoriteCoins() async {
    try{
      final response =await dio.get(favoriteControllerName);

      return (response.data as List)
          .map(
            (e) => GetFavoriteCoinResponse.fromJson(e),
      )
          .toList();
    }on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }

  }
}
