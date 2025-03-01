import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/usecases/combine_coins_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CombineCoinsUseCase combineCoinsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  HomeCubit({
    required this.combineCoinsUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(const HomeLoading(coins: [])) {
    fetchCoins();
  }

  Future<void> fetchCoins() async {
    emit(HomeLoading(coins: state.coins));
    try {
      final coins = await combineCoinsUseCase.call();
      emit(HomeLoaded(coins: coins));
    } on ApiError catch (e) {
      emit(HomeError(message: e.message ?? "", coins: state.coins));
    } catch (e) {
      emit(HomeError(message: e.toString(), coins: state.coins));
    }
  }

  Future<CoinEntity?> toggleFavorite(CoinEntity coin) async {
    try {
      emit(HomeRenew(coins: state.coins));
      final updatedCoin = await toggleFavoriteUseCase.call(coin);
      return updatedCoin;
    } on DioException catch (e) {
      emit(HomeError(message: (e).error.toString(), coins: state.coins));
    } catch (e) {
      emit(HomeError(message: e.toString(), coins: state.coins));
    }
    return null;
  }
}
