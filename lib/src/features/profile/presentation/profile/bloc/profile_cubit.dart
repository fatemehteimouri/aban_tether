import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/features/profile/domain/models/entities/me_entity.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/get_me_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetMeUseCase getMeUseCase;

  ProfileCubit({required this.getMeUseCase}) : super(ProfileInitial()) {
    fetchMe();
  }

  Future<void> fetchMe() async {
    emit(ProfileLoading());
    try {
      final meEntity = await getMeUseCase.call();
      emit(ProfileLoaded(meEntity: meEntity));
    } on DioException catch (e) {
      emit(ProfileError((e.error as ApiError).toString()));
    }catch (e){
      emit(ProfileError(e.toString()));

    }
  }
}
