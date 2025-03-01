import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/models/result_models/login_result.dart';

abstract class LoginRepo{
  Future<LoginResult> login(LoginParam param);
}