import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  ApiInterceptor({required this.tokenStorage});

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['requiresToken'] != true) {
      return super.onRequest(options, handler);
    }
    String? token = await tokenStorage.getToken();
    options.headers['Authorization'] = 'Bearer $token';
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    switch (response.statusCode) {
      case 200:
        return handler.next(response);
      case 500:
        return handler.reject(DioError(
          error: ApiError.fromJson(response.data),
          requestOptions: response.requestOptions,
          response: response,
          message: 'Server error occurred!',
        ));
      default:
        return handler.reject(DioError(
          error: ApiError.fromJson(response.data),
          requestOptions: response.requestOptions,
          response: response,
          message: response.statusMessage ?? 'Unknown error',
        ));
    }
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.error is ApiError) {
      return handler.next(err);
    } else {
      return handler.reject(err.copyWith(message: 'Unexpected Error!'));
    }
  }
}
