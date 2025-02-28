import 'package:aban_tether/src/features/login/presentation/login_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/', // مسیر پیش‌فرض
      redirect: (context, state) => '/login', // تغییر مسیر به صفحه لاگین
    ),
    GoRoute(
      name: loginAppRoute,
      path: '/login', // مسیر صفحه لاگین
      builder: (context, state) => const LoginScreen(),
    ),
    // GoRoute(
    //   path: '/home', // مسیر صفحه اصلی
    //   builder: (context, state) => HomeScreen(),
    // ),
  ]);
}
