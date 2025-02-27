import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../storage/token_storage.dart';

final getIt = GetIt.instance;

class AppStorageContainer{
  static T Get<T extends Object>() {
    return getIt.get<T>();
  }

  static void register() {
    getIt.registerLazySingleton(() => const FlutterSecureStorage());
    getIt.registerLazySingleton<TokenStorage>(() => TokenStorage(getIt<FlutterSecureStorage>()));
  }

}

