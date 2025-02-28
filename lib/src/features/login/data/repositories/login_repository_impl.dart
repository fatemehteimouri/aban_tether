import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:aban_tether/src/data/authentication_service/auth/data_sources/auth_remote_datasource.dart';
import 'package:aban_tether/src/features/login/data/mapper/login_param_ext.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';

class LoginImpl extends LoginRepo{
  final AuthRemoteDataSource authRemoteDataSource;
  final TokenStorage tokenStorage;

  LoginImpl({required this.authRemoteDataSource, required this.tokenStorage});
  @override
  Future<void> login(LoginParam param) {
    return authRemoteDataSource.login(param.toRequest()).then((response) {
      return tokenStorage.saveToken(response.authToken??"");
    });
  }

}