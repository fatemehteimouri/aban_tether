import 'package:aban_tether/src/features/home/domain/models/param_models/change_crypto_favorite_state_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class ChangeFavoriteCoinStateUseCase{
  final HomeRepo homeRepo;

  ChangeFavoriteCoinStateUseCase({required this.homeRepo});

  Future<void> call(ChangeFavoriteCoinStateParam param){
    if(param.isFavorite == true){
     return homeRepo.addCoinToFavorite(param);
    }else{
     return homeRepo.deleteCoinFromFavorite(param);
    }
  }
}