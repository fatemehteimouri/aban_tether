import 'package:aban_tether/src/data/authentication_service/auth/models/request_models/login_request.dart';
import 'package:aban_tether/src/data/authentication_service/auth/models/response_models/login_response.dart';
import 'package:aban_tether/src/data/authentication_service/auth/models/response_models/me_response.dart';
import 'package:dio/dio.dart';
part  '../constants/api_routes.dart';
class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  Future<LoginResponse> login(LoginRequest request) {
    return dio
        .post(loginApiRoute,data: request.toJson())
        .then((response) => LoginResponse.fromJson(response.data));
  }


  Future<MeResponse> getMe() {
    return dio
        .get(loginApiRoute,)
        .then((response) => MeResponse.fromJson(response.data));
  }
}
