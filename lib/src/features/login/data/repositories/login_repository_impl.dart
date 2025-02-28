import 'package:aban_tether/src/core/network/error/api_error.dart';
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
  Future<void> login(LoginParam param) async {
    try{
      final response = await authRemoteDataSource.login(param.toRequest());
      await tokenStorage.saveToken(response.authToken??"");
    }on ApiError catch (e){
      rethrow;
    }catch (e){
      throw ApiError(message: e.toString());
    }
  }

}