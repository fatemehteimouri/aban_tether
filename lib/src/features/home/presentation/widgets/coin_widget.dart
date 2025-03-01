import 'package:aban_tether/src/core/components/custom_image.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/presentation/widgets/coin_favorite_icon_button.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  final CoinEntity coin;
  const CoinWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    print(coin.iconAddress);
    return ListTile(
      title: Text(coin.name??"-"),
      subtitle: Text('${coin.price} USD'),
      leading: CustomImage(imageUrl:coin.iconAddress??''),
      trailing:  CoinFavoriteIconButton(coinEntity: coin,),
    );
  }
}
