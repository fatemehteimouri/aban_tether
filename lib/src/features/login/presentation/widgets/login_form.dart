import 'package:aban_tether/src/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context, listen: false);
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                cubit.loginParam = cubit.loginParam.copyWith(email: value);
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email()
              ]),
              decoration: const InputDecoration(hintText: "email"),
            ),
            TextFormField(
              onChanged: (value) {
                cubit.loginParam = cubit.loginParam.copyWith(password: value);
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              decoration: const InputDecoration(hintText: "password"),
            ),
          ],
        ));
  }
}
