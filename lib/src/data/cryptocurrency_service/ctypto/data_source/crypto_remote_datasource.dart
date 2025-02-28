import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/constants/api_routes.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/models/response_models/cryptocurrency_response.dart';
import 'package:dio/dio.dart';

class CryptoRemoteDatasource{
  final Dio dio;

  const CryptoRemoteDatasource({required this.dio});


  Future<List<CryptoCurrencyResponse>> getCryptoCurrencies(){
    return dio.get(getCryptoCurrenciesApiRoute).then((response) => (response.data as List).map((e) => CryptoCurrencyResponse.fromJson(e),).toList(),);
  }

}