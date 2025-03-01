import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:dio/dio.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  AuthInterceptor({required this.tokenStorage});

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (options.extra['requiresToken'] != false) {
      try {
        String? token = await tokenStorage.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        } else {
          return handler.reject(DioError(
            requestOptions: options,
            error: ApiError(message: 'توکن احراز هویت وجود ندارد'),
          ));
        }
      } catch (e) {
        return handler.reject(DioError(
          requestOptions: options,
          error: ApiError(message: 'خطا در دریافت توکن احراز هویت'),
        ));
      }
    }
   return handler.next(options);
  }

  @override
  Future<void> onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401) {
      handler.reject(err.copyWith(error: ApiError.fromJson(err.response?.data)));
    } else {
      handler.next(err);
    }
  }
}