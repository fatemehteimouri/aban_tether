import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email()
              ]),
              decoration: const InputDecoration(hintText: "email"),
            ),
            TextFormField(
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              decoration: const InputDecoration(hintText: "password"),
            ),

          ],
        ));
  }
}
