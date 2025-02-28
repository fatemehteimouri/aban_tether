import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';
import 'package:aban_tether/src/features/profile/domain/models/param_models/update_phone_number_param.dart';

abstract class ProfileRepo{
  Future<void> updatePhoneNumber(UpdatePhoneNumberParam param);
  Future<MeEntity> getMe();
}