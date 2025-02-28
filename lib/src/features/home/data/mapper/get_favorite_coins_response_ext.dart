import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/response_models/get_favorite_coin_response.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/favorite_coin_entity.dart';

extension GetFavoriteCoinResponseExt on GetFavoriteCoinResponse{
  FavoriteCoinEntity toEntity(){
    return FavoriteCoinEntity(cryptocurrencyId: cryptocurrencyId,id: id,createdAt: createdAt,userId: userId);
  }
}