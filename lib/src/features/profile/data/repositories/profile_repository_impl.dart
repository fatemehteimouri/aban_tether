import 'package:aban_tether/src/data/authentication_service/auth/data_sources/auth_remote_datasource.dart';
import 'package:aban_tether/src/data/authentication_service/user/data_source/user_remote_datasource.dart';
import 'package:aban_tether/src/features/profile/data/mapper/me_response_ext.dart';
import 'package:aban_tether/src/features/profile/data/mapper/update_phone_number_param_ext.dart';
import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';
import 'package:aban_tether/src/features/profile/domain/models/param_models/update_phone_number_param.dart';
import 'package:aban_tether/src/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepo{
  final UserRemoteDatasource userRemoteDatasource;
  final AuthRemoteDataSource authRemoteDataSource;

  ProfileRepositoryImpl({required this.userRemoteDatasource, required this.authRemoteDataSource});

  @override
  Future<void> updatePhoneNumber(UpdatePhoneNumberParam param) {
    return userRemoteDatasource.updatePhoneNumber(param.toRequest());
  }

  @override
  Future<MeEntity> getMe() {
    return authRemoteDataSource.getMe().then((response) => response.toEntity(),);
  }

}