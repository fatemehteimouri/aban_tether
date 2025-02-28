import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {

  ApiInterceptor();

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
          apiError = ApiError(message: 'خطای سرور');
          break;
        case DioExceptionType.connectionError:
          apiError = ApiError(message: 'خطای اتصال');
          break;
        default:
          apiError = ApiError(message: 'خطای ناشناخته');
          break;
      }
      return handler.reject(err.copyWith(
        error: apiError,
      ));
    }
  }
}
