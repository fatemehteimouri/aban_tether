import 'package:aban_tether/src/core/service_locators/repository_container.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';
import 'package:aban_tether/src/features/login/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class UseCaseContainer {
  static T Get<T extends Object>() {
    return getIt.get<T>();
  }



  static void register(){
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepo: RepositoryContainer.Get<LoginRepo>()));
  }

}