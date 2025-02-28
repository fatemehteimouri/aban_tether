import 'package:aban_tether/src/core/service_locators/repository_container.dart';
import 'package:aban_tether/src/features/home/domain/repositories/home_repository.dart';
import 'package:aban_tether/src/features/home/domain/usecases/add_coin_to_favorite_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/combine_coins_usecase.dart';
import 'package:aban_tether/src/features/home/domain/usecases/delete_coin_from_favorite_usecase.dart';
import 'package:aban_tether/src/features/login/domain/repositories/login_repository.dart';
import 'package:aban_tether/src/features/login/domain/usecases/login_usecase.dart';
import 'package:aban_tether/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/get_me_usecase.dart';
import 'package:aban_tether/src/features/profile/domain/usecases/update_phone_number_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class UseCaseContainer {
  static T Get<T extends Object>() {
    return getIt.get<T>();
  }



  static void register(){
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepo: RepositoryContainer.Get<LoginRepo>()));
    getIt.registerLazySingleton<CombineCoinsUseCase>(() => CombineCoinsUseCase(homeRepo: RepositoryContainer.Get<HomeRepo>()));
    getIt.registerLazySingleton<AddCoinToFavoriteUseCase>(() => AddCoinToFavoriteUseCase(homeRepo: RepositoryContainer.Get<HomeRepo>()));
    getIt.registerLazySingleton<DeleteCoinFromFavoriteUseCase>(() => DeleteCoinFromFavoriteUseCase(homeRepo: RepositoryContainer.Get<HomeRepo>()));
    getIt.registerLazySingleton<GetMeUseCase>(() => GetMeUseCase(profileRepo: RepositoryContainer.Get<ProfileRepo>()));
    getIt.registerLazySingleton<UpdatePhoneNumberUseCase>(() => UpdatePhoneNumberUseCase(profileRepo: RepositoryContainer.Get<ProfileRepo>()));
  }

}