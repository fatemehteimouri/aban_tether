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

  Future<void> login(LoginParam param) async {
    emit(LoginLoading());
    try {
      await loginUseCase.call(param);
      emit(LoginSuccess()); // حالت success
    } catch (e) {
      print(e);
      final String errorMessage = (e is DioError)
          ? (e.error as ApiError?)?.message ?? ""
          : 'Login failed: $e';

      emit(LoginFailure(errorMessage));
    }
  }
}
