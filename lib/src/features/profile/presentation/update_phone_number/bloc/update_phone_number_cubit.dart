import 'package:aban_tether/src/features/profile/domain/models/param_models/update_phone_number_param.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/update_phone_number_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'update_phone_number_state.dart';

class UpdatePhoneNumberCubit extends Cubit<UpdatePhoneNumberState> {
  final UpdatePhoneNumberUseCase updatePhoneNumberUseCase;

  UpdatePhoneNumberCubit({required this.updatePhoneNumberUseCase}) : super(UpdatePhoneNumberInitial());


  UpdatePhoneNumberParam param = UpdatePhoneNumberParam();

  Future<void> updatePhoneNumber() async {
    emit(UpdatePhoneNumberLoading());
    try {
      await updatePhoneNumberUseCase.call(param);

      emit(UpdatePhoneNumberSuccess());
    } catch (e) {
      emit(UpdatePhoneNumberFailure('Failed to update phone number: $e'));
    }
  }

}