import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  ApiInterceptor({required this.tokenStorage});

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.error is ApiError) {
      return handler.next(err);
    } else {
      ApiError apiError;
      switch (err.type) {
        case DioExceptionType.badResponse:
          apiError = ApiError.fromJson(err.response?.data);
          break;
        case DioExceptionType.connectionTimeout:
          apiError = ApiError(message: 'خطای سرور: ${err.message}');
          break;
        case DioExceptionType.connectionError:
          apiError = ApiError(message: 'خطای اتصال: ${err.message}');
          break;
        default:
          apiError = ApiError(message: 'خطای ناشناخته: ${err.message}');
          break;
      }

      return handler.reject(err.copyWith(
        error: apiError,
      ));
    }
  }
}
