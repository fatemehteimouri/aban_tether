import 'package:aban_tether/src/features/profile/domain/models/param_models/update_phone_number_param.dart';
import 'package:aban_tether/src/features/profile/domain/repositories/profile_repository.dart';

class UpdatePhoneNumberUseCase{
final ProfileRepo profileRepo;

  UpdatePhoneNumberUseCase({required this.profileRepo});



  Future<void> call(UpdatePhoneNumberParam param){
    return profileRepo.updatePhoneNumber(param);
  }
}
