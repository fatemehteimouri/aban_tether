import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';
import 'package:aban_tether/src/features/profile/domain/models/param_models/update_phone_number_param.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/update_phone_number_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'update_phone_number_state.dart';

class UpdatePhoneNumberCubit extends Cubit<UpdatePhoneNumberState> {
  final UpdatePhoneNumberUseCase updatePhoneNumberUseCase;
  final MeEntity meEntity;

  UpdatePhoneNumberCubit({required this.meEntity, required this.updatePhoneNumberUseCase}) : super(UpdatePhoneNumberInitial());


  UpdatePhoneNumberParam param = UpdatePhoneNumberParam();

  Future<void> updatePhoneNumber() async {
    emit(UpdatePhoneNumberLoading());
    try {
      await updatePhoneNumberUseCase.call(param: param,userId: meEntity.id!);
      emit(UpdatePhoneNumberSuccess());
    } on DioException catch (e) {
      emit(UpdatePhoneNumberFailure((e.error as ApiError).toString()));
    }catch (e){
      emit(UpdatePhoneNumberFailure(e.toString()));

    }
  }

}