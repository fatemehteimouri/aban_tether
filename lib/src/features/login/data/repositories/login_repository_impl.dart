import 'package:aban_tether/src/data/authentication_service/auth/data_sources/auth_remote_datasource.dart';
import 'package:aban_tether/src/features/login/data/mapper/login_param_ext.dart';
import 'package:aban_tether/src/features/login/data/mapper/login_response_ext.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/models/result_models/login_result.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';

class LoginImpl extends LoginRepo{
  final AuthRemoteDataSource authRemoteDataSource;

  LoginImpl({required this.authRemoteDataSource});
  @override
  Future<LoginResult> login(LoginParam param) async {
    try{
      final response = await authRemoteDataSource.login(param.toRequest());
      return response.toResult();
    }catch (e){
      rethrow;
    }
  }

}