import 'package:aban_tether/src/core/config/theme/app_themes.dart';
import 'package:aban_tether/src/core/config/theme/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/router/app_router.dart';

class App extends StatelessWidget {

  const App({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),

      child: Builder(
        builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                theme: state.isDark ? AppThemes.darkTheme :AppThemes.lightTheme,
                debugShowCheckedModeBanner: false,
              );
            }
          );
        }
      ),
    );
  }
}