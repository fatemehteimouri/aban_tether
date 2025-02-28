import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class AddCoinToFavoriteUseCase{
  final HomeRepo homeRepo;

  const AddCoinToFavoriteUseCase({required this.homeRepo});


  Future<int> call(AddCoinToFavoriteParam param){
    return homeRepo.addCoinToFavorite(param);
  }

}