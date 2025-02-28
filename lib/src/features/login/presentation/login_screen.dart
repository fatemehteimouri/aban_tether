import 'package:aban_tether/src/core/components/switch_app_theme.dart';
import 'package:aban_tether/src/core/config/theme/bloc/theme_cubit.dart';
import 'package:aban_tether/src/core/service_locators/usecase_container.dart';
import 'package:aban_tether/src/features/login/domain/usecases/login_usecase.dart';
import 'package:aban_tether/src/features/login/presentation/bloc/login_cubit.dart';
import 'package:aban_tether/src/features/login/presentation/widgets/login_button.dart';
import 'package:aban_tether/src/features/login/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(loginUseCase: UseCaseContainer.Get<LoginUseCase>()),
      child: Scaffold(
        appBar: AppBar(actions: const [
          SwitchAppTheme()

        ]),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoginForm(
                formKey: _formKey,
              )),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoginButton(formKey: _formKey),
        ),
      ),
    );
  }
}
