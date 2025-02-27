import 'package:aban_tether/src/core/service_locators/data_source_container.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:aban_tether/src/data/auth/data_sources/auth_remote_datasource.dart';
import 'package:aban_tether/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';
import 'package:get_it/get_it.dart';

import 'app_storage_container.dart';

final getIt = GetIt.instance;

class RepositoryContainer {
  static T Get<T extends Object>() {
    return getIt.get<T>();
  }

  static void register(){
    getIt.registerLazySingleton<LoginRepo>(() => LoginImpl(authRemoteDataSource: DataSourceContainer.Get<AuthRemoteDataSource>(), tokenStorage: AppStorageContainer.Get<TokenStorage>()));
  }
}