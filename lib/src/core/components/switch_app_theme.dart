import 'package:aban_tether/src/core/config/theme/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchAppTheme extends StatelessWidget {
  const SwitchAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDark,
          onChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
          activeColor: Colors.amber, // رنگ سوییچ در حالت فعال
        );
      },
    );
  }
}
