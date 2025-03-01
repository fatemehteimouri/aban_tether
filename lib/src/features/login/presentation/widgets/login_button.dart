import 'package:aban_tether/src/core/config/router/app_routes.dart';
import 'package:aban_tether/src/core/extensions/context_extension.dart';
import 'package:aban_tether/src/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginSuccess || current is LoginFailure,
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.goNamed(homeAppRoute);
          } else if (state is LoginFailure) {
            context.showSnack(state.message);
          }
        },
        builder: (context, state) {
          final bool isLoading = state is LoginLoading;
          return ElevatedButton(
            onPressed: isLoading
                ? null
                : () async {
                    if (formKey.currentState!.validate()) {
                      final cubit =
                          BlocProvider.of<LoginCubit>(context, listen: false);
                      return cubit.login();
                    }
                  },
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text("Submit"),
          );
        });
  }
}
