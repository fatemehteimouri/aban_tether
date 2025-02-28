import 'package:aban_tether/src/data/authentication_service/auth/models/response_models/me_response.dart';
import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';

extension MeResponseExt on MeResponse{


  MeEntity toEntity(){
    return MeEntity(id: id,email: email,name: name);
  }
}