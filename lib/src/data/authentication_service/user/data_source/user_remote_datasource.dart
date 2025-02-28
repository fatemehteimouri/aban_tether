import 'package:aban_tether/src/data/authentication_service/user/constants/api_routes.dart';
import 'package:aban_tether/src/data/authentication_service/user/models/request_models/update_phone_number_request.dart';
import 'package:aban_tether/src/data/authentication_service/user/models/response_models/update_phone_number_response.dart';
import 'package:dio/dio.dart';

class UserRemoteDatasource{
  final Dio dio;

  UserRemoteDatasource({required this.dio});

Future<UpdatePhoneNumberResponse> updatePhoneNumber(UpdatePhoneNumberRequest request){
  return dio.put(updatePhoneNumberApiRoute,data: request.toJson()).then((response) => UpdatePhoneNumberResponse.fromJson(response.data),);
}


}