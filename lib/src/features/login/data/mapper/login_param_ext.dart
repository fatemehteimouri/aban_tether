import 'package:aban_tether/src/data/authentication_service/auth/models/request_models/login_request.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';

extension LoginExt on LoginParam {
  LoginRequest toRequest() {
    return LoginRequest(email: email, password: password);
  }
}
