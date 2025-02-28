import 'package:aban_tether/src/core/extensions/list_extension.dart';
import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/add_coin_to_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/models/param_models/delete_coin_from_favorite_param.dart';
import 'package:aban_tether/src/features/home/domain/usecases/add_coin_to_favorite_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/combine_coins_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/delete_coin_from_favorite_usecase.dart';
import 'package:dio/dio.dart';
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
  }) : super(HomeInitial()) {
    fetchCoins();
  }

  Future<void> fetchCoins() async {
    emit(HomeLoading());
    try {
      final coins = await combineCoinsUseCase.call();
      emit(HomeLoaded(coins));
    } on ApiError catch (e) {
      emit(HomeError(e.message ?? ""));
    } catch (e) {
      emit(const HomeError('An unexpected error occurred'));
    }
  }

  Future<void> toggleFavoriteHome({required CoinEntity coin}) async {
    try {
      final currentState = (state as HomeLoaded);
      final coins = currentState.coins;
      if (coin.isFavorite && coin.favoriteId != null) {
        await _deleteFromFavorite(favoriteId: coin.favoriteId!);
        coins.replaceWhere(
          test: (element) => element.favoriteId == coin.favoriteId,
          replace: (element) =>
              element.copyWith(favoriteId: null, isFavorite: false),
        );
      } else {
        final favoriteId = await _addToFavorite(id: coin.id!);
        coins.replaceWhere(
          test: (element) => element.id == coin.id,
          replace: (element) =>
              element.copyWith(favoriteId: favoriteId, isFavorite: true),
        );
      }

      emit(HomeLoaded(coins));
    } on DioException catch (e) {
      emit(HomeError((e.error as ApiError).toString()));
    } catch (e) {
      emit(const HomeError('An unexpected error occurred'));
    }
  }

  Future<int?> _addToFavorite({required int id}) async {
    try {
      final favoriteId =
          await addCoinToFavoriteUseCase.call(AddCoinToFavoriteParam(id: id));
      return favoriteId;
    } on DioException catch (e) {
      emit(HomeError((e.error as ApiError).toString()));
    } catch (e) {
      emit(const HomeError('An unexpected error occurred'));
    }
    return null;
  }

  Future<void> _deleteFromFavorite({required int favoriteId}) async {
    try {
      await deleteCoinFromFavoriteUseCase
          .call(DeleteCoinFromFavoriteParam(favoritesId: favoriteId));
    } on DioException catch (e) {
      emit(HomeError((e.error as ApiError).toString()));
    } catch (e) {
      emit(const HomeError('An unexpected error occurred'));
    }
  }
}
