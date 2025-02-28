import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/data/authentication_service/user/constants/api_routes.dart';
import 'package:aban_tether/src/data/authentication_service/user/models/request_models/update_phone_number_request.dart';
import 'package:aban_tether/src/data/authentication_service/user/models/response_models/update_phone_number_response.dart';
import 'package:dio/dio.dart';

class UserRemoteDatasource {
  final Dio dio;

  UserRemoteDatasource({required this.dio});

  Future<UpdatePhoneNumberResponse> updatePhoneNumber(
      {required UpdatePhoneNumberRequest request, required int userId}) async {
    try {
      final response =
          await dio.put("$userControllerName/{$userId}", data: request.toJson());
      return UpdatePhoneNumberResponse.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw ApiError(message: 'خطای ناشناخته: ${e.toString()}');
    }
  }
}
