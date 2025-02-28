import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  const LoginUseCase({required this.loginRepo});

  Future<void> call(LoginParam param) async {
    try {
      await loginRepo.login(param);
    } catch (e) {
      rethrow;
    }
  }
}
