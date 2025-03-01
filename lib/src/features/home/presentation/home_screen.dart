import 'package:aban_tether/src/core/components/switch_app_theme.dart';
import 'package:aban_tether/src/core/config/router/app_routes.dart';
import 'package:aban_tether/src/core/service_locators/usecase_container.dart';
import 'package:aban_tether/src/features/home/domain/usecases/combine_coins_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:aban_tether/src/features/home/presentation/bloc/home_cubit.dart';
import 'package:aban_tether/src/features/home/presentation/widgets/coins_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SwitchAppTheme()
        ],
        leading: IconButton(
            onPressed: () {
              context.pushNamed(profileAppRoute);
            },
            icon: const Icon(Icons.person_2_rounded)),
      ),
      body: BlocProvider(
          create: (context) => HomeCubit(
              combineCoinsUseCase: UseCaseContainer.Get<CombineCoinsUseCase>(),
              toggleFavoriteUseCase:
                  UseCaseContainer.Get<ToggleFavoriteUseCase>()),
          child: const CoinsList()),
    );
  }
}
