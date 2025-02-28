import 'package:aban_tether/src/features/home/presentation/home_screen.dart';
import 'package:aban_tether/src/features/login/presentation/login_screen.dart';
import 'package:aban_tether/src/features/profile/presentation/profile_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home', // تغییر مسیر به صفحه لاگین
    ),
    GoRoute(
      name: loginAppRoute,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),    GoRoute(
      name: profileAppRoute,
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
