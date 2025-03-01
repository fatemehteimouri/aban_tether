import 'package:aban_tether/src/core/components/custom_image.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:aban_tether/src/features/home/presentation/widgets/coin_favorite_icon_button.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  final CoinEntity coin;
  const CoinWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(child: Text(coin.name??"-",style: const TextStyle(overflow: TextOverflow.ellipsis,),maxLines: 1,)),
        ],
      ),

      subtitle: Text('${coin.price} USD'),
      leading: CachedSvgImage(imageUrl:coin.iconAddress),
      trailing:  CoinFavoriteIconButton(coinEntity: coin,),
    );
  }
}
