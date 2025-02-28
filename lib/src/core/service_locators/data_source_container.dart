import 'package:aban_tether/src/core/network/api_type.dart';
import 'package:aban_tether/src/core/network/dio_client.dart';
import 'package:aban_tether/src/core/service_locators/dio_container.dart';
import 'package:aban_tether/src/data/authentication_service/auth/data_sources/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DataSourceContainer {
  static T Get<T extends Object>() {
    return getIt.get<T>();
  }



  static void register(){
    getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(dio: DioContainer.Get<DioClient>(ApiType.auth)));
  }

}