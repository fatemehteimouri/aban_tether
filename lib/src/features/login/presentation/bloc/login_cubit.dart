import 'package:aban_tether/src/core/network/error/api_error.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  LoginParam loginParam = LoginParam();

  Future<void> login() async {
    emit(LoginLoading());
    try {
      await loginUseCase.call(loginParam);
      emit(LoginSuccess());
    } on DioException catch (e) {
      emit(LoginFailure((e.error as ApiError).toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
