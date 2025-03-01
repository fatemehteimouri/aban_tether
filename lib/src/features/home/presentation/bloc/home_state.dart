part of 'home_cubit.dart';


abstract class HomeState extends Equatable{
  final List<CoinEntity> coins;

  const HomeState({required this.coins});

  HomeState copyWith({
    List<CoinEntity>? coins,
  });

  @override
  List<Object?> get props => coins;
}

class HomeLoading extends HomeState {
  const HomeLoading({required super.coins});
  @override
  HomeLoaded copyWith({
    List<CoinEntity>? coins,
  }) {
    return HomeLoaded(
      coins: coins ?? this.coins,
    );
  }
}
class HomeRenew extends HomeState {
  const HomeRenew({required super.coins});
  @override
  HomeLoaded copyWith({
    List<CoinEntity>? coins,
  }) {
    return HomeLoaded(
      coins: coins ?? this.coins,
    );
  }
}

class HomeLoaded extends HomeState {

  const HomeLoaded({required super.coins});

  @override
  HomeLoaded copyWith({
    List<CoinEntity>? coins,
  }) {
    return HomeLoaded(
      coins: coins ?? this.coins,
    );
  }

  @override
  List<Object?> get props => coins;
}


class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message, required super.coins});



  @override
  HomeError copyWith({
    String? message,
    List<CoinEntity>? coins,
  }) {
    return HomeError(
      message: message ?? this.message,
      coins: coins ?? this.coins,
    );
  }

  @override
  List<Object?> get props => [message,coins];
}