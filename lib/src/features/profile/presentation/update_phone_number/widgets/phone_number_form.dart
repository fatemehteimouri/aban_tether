import 'package:aban_tether/src/core/extensions/context_extension.dart';
import 'package:aban_tether/src/features/profile/presentation/update_phone_number/bloc/update_phone_number_cubit.dart';
import 'package:aban_tether/src/utils/validators/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class UpdatePhoneNumberForm extends StatefulWidget {
  const UpdatePhoneNumberForm({super.key});

  @override
  State<UpdatePhoneNumberForm> createState() => _UpdatePhoneNumberFormState();
}

class _UpdatePhoneNumberFormState extends State<UpdatePhoneNumberForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit =
        BlocProvider.of<UpdatePhoneNumberCubit>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.phoneNumber(
                  regex: RegExp(AppRegex.iranianMobile)),
            ]),
            onChanged: (value) {
              cubit.param = cubit.param.copyWith(phoneNumber: value);
            },
          ),
          const SizedBox(height: 30),
          BlocConsumer<UpdatePhoneNumberCubit, UpdatePhoneNumberState>(
              listenWhen: (previous, current) =>
                  current is UpdatePhoneNumberSuccess ||
                  current is UpdatePhoneNumberFailure,
              listener: (context, state) {
                if (state is UpdatePhoneNumberSuccess) {
                  context.pop();
                } else if (state is UpdatePhoneNumberFailure) {
                  context.showSnack(state.message);
                }
              },
              builder: (context, state) {
                return _buildUpdateButton(context, state);
              }),
        ],
      ),
    );
  }

  Widget _buildUpdateButton(
      BuildContext context, UpdatePhoneNumberState state) {
    final cubit = context.read<UpdatePhoneNumberCubit>();
    final isLoading = state is UpdatePhoneNumberLoading;

    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              if (_formKey.currentState?.validate() ?? false) {
                cubit.updatePhoneNumber();
              }
            },
      child:
          isLoading ? const CircularProgressIndicator() : const Text('Update'),
    );
  }
}
