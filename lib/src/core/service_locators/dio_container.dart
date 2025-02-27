import 'package:aban_tether/src/core/network/api_type.dart';
import 'package:aban_tether/src/core/network/dio_client.dart';
import 'package:aban_tether/src/core/service_locators/app_storage_container.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DioContainer {
  static T Get<T extends Object>(ApiType apiType) {
    return getIt.get<T>(instanceName: apiType.name);

  }

  static void register(){
    final tokenStorage = AppStorageContainer.Get<TokenStorage>();
    getIt.registerLazySingleton(() => DioClient(apiType: ApiType.auth, tokenStorage: tokenStorage));
    getIt.registerLazySingleton(() => DioClient(apiType: ApiType.crypto, tokenStorage: tokenStorage));



  }
}
