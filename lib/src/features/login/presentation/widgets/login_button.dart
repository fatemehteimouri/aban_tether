import 'package:aban_tether/src/core/components/buttons/elevated_buttons.dart';
import 'package:aban_tether/src/features/login/domain/models/param_models/login_param.dart';
import 'package:aban_tether/src/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onTap: () async{
        if (!formKey.currentState!.validate()) {
          final cubit = BlocProvider.of<LoginCubit>(context,listen: false);
          cubit.login(LoginParam());
        }
      },
      title: "Submit",
    );
  }
}
