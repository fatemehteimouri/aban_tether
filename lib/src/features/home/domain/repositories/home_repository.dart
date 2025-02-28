import 'package:aban_tether/src/features/home/domain/models/entities/cryptocurrency_entity.dart';

abstract class HomeRepo{
  Future<CryptoCurrencyEntity> getCryptoCurrencies();
}