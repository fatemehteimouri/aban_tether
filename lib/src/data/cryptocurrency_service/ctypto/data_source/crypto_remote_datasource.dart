import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/constants/api_routes.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/models/response_models/cryptocurrency_response.dart';
import 'package:dio/dio.dart';

class CryptoRemoteDatasource {
  final Dio dio;

  const CryptoRemoteDatasource({required this.dio});

  Future<List<CryptoCurrencyResponse>> getCryptoCurrencies() async {
    try {
      final response = await dio.get(getCryptoCurrenciesApiRoute);
      return (response.data as List)
          .map(
            (e) => CryptoCurrencyResponse.fromJson(e),
          )
          .toList();
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }
  }
}
