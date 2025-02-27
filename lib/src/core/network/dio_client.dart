import 'package:aban_tether/src/core/network/interceptors/api_interceptor.dart';
import 'package:dio/dio.dart';

import 'api_type.dart';

class DioClient {
  static void registerDioClients() {
    getIt.registerLazySingleton<Dio>(() => _createDio(ApiType.auth),
        instanceName: ApiType.auth.name);
    getIt.registerLazySingleton<Dio>(() => _createDio(ApiType.crypto),
        instanceName: ApiType.crypto.name);
  }

  static Dio _createDio(ApiType apiType) {
    Dio dio = Dio(apiType.baseOptions);


    dio.interceptors.add(ApiInterceptor());

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseBody: true,
      error: true,
      requestBody: true,
    ));

    return dio;
  }
}
