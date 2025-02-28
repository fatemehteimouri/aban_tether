import 'package:aban_tether/src/data/cryptocurrency_service/favorite/models/request_models/add_coin_to_favorite_request.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';

extension AddCoinToFavoriteParamExt on AddCoinToFavoriteParam{



  AddCoinToFavoriteRequest toRequest(){
    return AddCoinToFavoriteRequest(cryptocurrencyId: id);
  }

}