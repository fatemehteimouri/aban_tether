import 'package:aban_tether/src/data/authentication_service/user/models/request_models/update_phone_number_request.dart';
import 'package:aban_tether/src/features/profile/domain/models/param_models/update_phone_number_param.dart';

extension UpdatePhoneNumberParamExt on UpdatePhoneNumberParam{


  UpdatePhoneNumberRequest toRequest(){
    return UpdatePhoneNumberRequest(phoneNumber: phoneNumber);
  }
}