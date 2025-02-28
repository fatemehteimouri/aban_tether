import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/request_models/delete_coin_from_favorite_request.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';

extension DeleteCoinFromFavoriteParamExt on DeleteCoinFromFavoriteParam {
  DeleteCoinFromFavoriteRequest toRequest() {
    return DeleteCoinFromFavoriteRequest(favoritesId: favoritesId);
  }
}
