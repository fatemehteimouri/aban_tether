import 'package:aban_tether/src/features/home/presentation/bloc/home_cubit.dart';
import 'package:aban_tether/src/features/home/presentation/widgets/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeLoaded) {
          return ListView.builder(
            itemCount: state.coins.length,
            itemBuilder: (context, index) {
              final coin = state.coins[index];
              return CoinWidget(coin: coin);
            },
          );
        }
        if (state is HomeError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
