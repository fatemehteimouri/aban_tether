import 'package:flutter/material.dart';

import 'src/core/config/router/app_router.dart';

class App extends StatelessWidget {

  const App({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}