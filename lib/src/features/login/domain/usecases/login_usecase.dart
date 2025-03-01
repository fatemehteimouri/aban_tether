import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepo loginRepo;
  final TokenStorage tokenStorage;


  const LoginUseCase( {required this.tokenStorage,required this.loginRepo});

  Future<void> call(LoginParam param) async {
    try {
      final result = await loginRepo.login(param);
      await tokenStorage.saveToken(result.authToken??"");
    } catch (e) {
      rethrow;
    }
  }
}
