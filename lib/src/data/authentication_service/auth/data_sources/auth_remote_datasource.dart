import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/data/authentication_service/auth/constants/api_routes.dart';
import 'package:aban_tether/src/data/authentication_service/auth/models/request_models/login_request.dart';
import 'package:aban_tether/src/data/authentication_service/auth/models/response_models/login_response.dart';
import 'package:aban_tether/src/data/authentication_service/auth/models/response_models/me_response.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        loginApiRoute,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }
  }

  Future<MeResponse> getMe() async {
    try {
      final response = await dio.get(meApiRoute);
      return MeResponse.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }
  }
}