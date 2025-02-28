import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/presentation/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinFavoriteIconButton extends StatefulWidget {
  final CoinEntity coinEntity;

  const CoinFavoriteIconButton({super.key, required this.coinEntity});

  @override
  State<CoinFavoriteIconButton> createState() => _CoinFavoriteIconButtonState();
}

class _CoinFavoriteIconButtonState extends State<CoinFavoriteIconButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CircularProgressIndicator();
    } else {
      return IconButton(
        icon: Icon(widget.coinEntity.isFavorite
            ? Icons.favorite
            : Icons.favorite_border),
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          await context
              .read<HomeCubit>()
              .toggleFavoriteHome(coin: widget.coinEntity);
          setState(() {
            _isLoading = false;
          });
        },
      );
    }
  }
}
