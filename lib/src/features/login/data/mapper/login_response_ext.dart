import 'package:aban_tether/src/data/authentication_service/auth/models/response_models/login_response.dart';
import 'package:aban_tether/src/features/login/domain/models/result_models/login_result.dart';

extension LoginResponseExt on LoginResponse{
  LoginResult toResult(){
    return LoginResult(authToken: authToken);
  }
}