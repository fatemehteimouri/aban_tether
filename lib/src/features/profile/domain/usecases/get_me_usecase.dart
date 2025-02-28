import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';
import 'package:aban_tether/src/features/profile/domain/repositories/profile_repository.dart';

class GetMeUseCase{
  final ProfileRepo profileRepo;

  GetMeUseCase({required this.profileRepo});


  Future<MeEntity> call(){
    return profileRepo.getMe();
  }

}