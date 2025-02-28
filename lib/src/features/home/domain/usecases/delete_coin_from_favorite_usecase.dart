import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';

class DeleteCoinFromFavoriteUseCase {
  final HomeRepo homeRepo;

  const DeleteCoinFromFavoriteUseCase({required this.homeRepo});

  Future<void> call(DeleteCoinFromFavoriteParam param) async {
    try {
      await homeRepo.deleteCoinFromFavorite(param);
    } catch (e) {
      rethrow;
    }
  }
}
