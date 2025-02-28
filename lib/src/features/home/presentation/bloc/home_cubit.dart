import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/usecases/add_coin_to_favorite_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/combine_coins_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/delete_coin_from_favorite_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CombineCoinsUseCase combineCoinsUseCase;
  final AddCoinToFavoriteUseCase addCoinToFavoriteUseCase;
  final DeleteCoinFromFavoriteUseCase deleteCoinFromFavoriteUseCase;

  HomeCubit({
    required this.combineCoinsUseCase,
    required this.addCoinToFavoriteUseCase,
    required this.deleteCoinFromFavoriteUseCase,
  }) : super(HomeInitial());

  Future<void> fetchCoins() async {
    emit(HomeLoading());
    try {
      final coins = await combineCoinsUseCase.call();
      emit(HomeLoaded(coins));
    } on ApiError catch (e) {
      emit(HomeError(e.message??""));
    } catch (e) {
      emit(const HomeError('An unexpected error occurred'));
    }
  }

  // Future<void> toggleFavoriteHome(String coinId, bool isFavorite, String? favoriteId) async {
  //   try {
  //     if (isFavorite) {
  //       await removeFavoriteHomeUseCase(favoriteId!); // حذف از علاقه‌مندی‌ها
  //     } else {
  //       await addFavoriteHomeUseCase(coinId); // افزودن به علاقه‌مندی‌ها
  //     }
  //     emit(HomeFavoriteToggled(coinId, !isFavorite, favoriteId));
  //   } on ApiError catch (e) {
  //     emit(HomeError(e.message??""));
  //   } catch (e) {
  //     emit(const HomeError('An unexpected error occurred'));
  //   }
  // }
}