import 'package:aban_tether/src/core/network/interceptors/api_interceptor.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_type.dart';


class DioClient  with DioMixin implements Dio{
  final ApiType apiType;
  final TokenStorage tokenStorage;
  DioClient({required this.apiType, required this.tokenStorage}):super(){
    options = BaseOptions(
      validateStatus: (status) => status == 200 || status == 201,
      baseUrl: apiType.baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    interceptors.add(ApiInterceptor(tokenStorage: tokenStorage));
  }

}
