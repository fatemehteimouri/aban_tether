import 'package:aban_tether/src/core/service_locators/data_source_container.dart';
import 'package:aban_tether/src/core/storage/token_storage.dart';
import 'package:aban_tether/src/data/authentication_service/auth/data_sources/auth_remote_datasource.dart';
import 'package:aban_tether/src/data/authentication_service/user/data_source/user_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/ctypto/data_source/crypto_remote_datasource.dart';
import 'package:aban_tether/src/data/cryptocurrency_service/favorite/data_source/favorites_remote_datasource.dart';
import 'package:aban_tether/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';
import 'package:aban_tether/src/features/login/data/repositories/login_repository_impl.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';
import 'package:aban_tether/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:aban_tether/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:get_it/get_it.dart';

import 'app_storage_container.dart';

final getIt = GetIt.instance;

class RepositoryContainer {
  static T Get<T extends Object>() {
    return getIt.get<T>();
  }

  static void register(){
    getIt.registerLazySingleton<LoginRepo>(() => LoginImpl(authRemoteDataSource: DataSourceContainer.Get<AuthRemoteDataSource>()));
    getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepositoryImpl(authRemoteDataSource: DataSourceContainer.Get<AuthRemoteDataSource>(), userRemoteDatasource: AppStorageContainer.Get<UserRemoteDatasource>()));
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(cryptoRemoteDatasource: DataSourceContainer.Get<CryptoRemoteDatasource>(), favoriteRemoteDatasource: DataSourceContainer.Get<FavoriteRemoteDatasource>()));
  }
}