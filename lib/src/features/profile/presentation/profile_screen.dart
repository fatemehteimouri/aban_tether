import 'package:aban_tether/src/core/components/switch_app_theme.dart';
import 'package:aban_tether/src/core/service_locators/usecase_container.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/get_me_usecase.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/update_phone_number_usecase.dart';
import 'package:aban_tether/src/features/profile/presentation/profile/bloc/profile_cubit.dart';
import 'package:aban_tether/src/features/profile/presentation/profile/widgets/profile_form.dart';
import 'package:aban_tether/src/features/profile/presentation/update_phone_number/bloc/update_phone_number_cubit.dart';
import 'package:aban_tether/src/features/profile/presentation/update_phone_number/widgets/phone_number_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SwitchAppTheme()
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProfileCubit(getMeUseCase: UseCaseContainer.Get<GetMeUseCase>()),),
          BlocProvider(create: (_) => UpdatePhoneNumberCubit(updatePhoneNumberUseCase: UseCaseContainer.Get<UpdatePhoneNumberUseCase>()),)
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<ProfileCubit,ProfileState>(

              buildWhen: (previous, current) => current is! ProfileInitial,
                builder: (context,state) {
                if(state is ProfileLoaded){
                  return  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileForm(meEntity: state.meEntity,),
                      const UpdatePhoneNumberForm(),
                    ],
                  );
                }else if(state is ProfileLoading){
                  return const Center(child: CircularProgressIndicator());
                }else if(state is ProfileError){
                  return  Center(child: Text(state.message));
                }else{
                  return const SizedBox();
                }

              }
            );
          }
        ),
      ),
    );
  }
}
