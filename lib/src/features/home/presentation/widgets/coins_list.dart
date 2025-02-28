import 'package:aban_tether/src/core/extensions/context_extension.dart';
import 'package:aban_tether/src/features/home/presentation/bloc/home_cubit.dart';
import 'package:aban_tether/src/features/home/presentation/widgets/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current is HomeError,
      listener: (context, state) {
        if(state is HomeError){
          context.showSnack(state.message);
        }
      },
      buildWhen: (previous, current) => current is HomeLoading || current is HomeLoaded,
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
