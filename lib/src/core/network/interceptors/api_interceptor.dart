import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final apiError = _handleDioError(err);
    return super.onError(err, handler);
  }

  ApiError _handleDioError(DioError error) {
    String message = 'An unexpected error occurred';
    int? statusCode = error.response?.statusCode;
    String? errorDetails = error.response?.statusMessage;

    switch (statusCode) {
      case 400:
        message = "Input Error. Check the request payload for issues.";
        break;
      case 401:
        message = "Unauthorized. Please check your credentials.";
        break;
      case 403:
        message = "Access denied. Additional privileges are needed to access the requested resource.";
        break;
      case 404:
        message = "Not Found. The requested resource does not exist.";
        break;
      case 429:
        message = "Rate Limited. Too many requests.";
        break;
      case 500:
        message = "Unexpected error. Something went wrong on the server.";
        break;
      default:
        message = errorDetails ?? 'An unknown error occurred.';
    }

    return ApiError(message: message, statusCode: statusCode, errorDetails: errorDetails);
  }
}
