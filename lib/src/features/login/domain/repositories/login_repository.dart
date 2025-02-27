import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';

abstract class LoginRepo{
  Future<void> login(LoginParam param);
}