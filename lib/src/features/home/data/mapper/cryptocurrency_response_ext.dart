import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/models/response_models/cryptocurrency_response.dart';
import 'package:aban_tether/src/features/home/domain/models/entities/coin_entity.dart';

extension CryptoCurrencyResponseExt on CryptoCurrencyResponse{

  CoinEntity toEntity() {
    return CoinEntity(
        createdAt: createdAt,
        id: id,
        name: name,
        iconAddress: iconAddress,
        isFavorite: isFavorite,
        price: price,
        symbol: symbol
    );
  }
}