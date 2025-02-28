import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  final CoinEntity coin;
  const CoinWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(coin.name??"-"),
      subtitle: Text('${coin.price} USD'),
      leading: Image.network(coin.iconAddress??''),
      trailing: IconButton(
        icon: Icon(coin.isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          // context.read<Ho>().toggleFavoriteCoin(
          //   coin.id,
          //   coin.isFavorite,
          //   coin.favoriteId,
          // );
        },
      ),
    );
  }
}
