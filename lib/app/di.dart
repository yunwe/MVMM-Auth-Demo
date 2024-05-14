import 'package:get_it/get_it.dart';
import 'package:mvmm_auth_demo/data/auth/repository/repository_impl.dart';
import 'package:mvmm_auth_demo/domain/channels/user_channel.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:mvmm_auth_demo/domain/usecase/login_usecase.dart';
import 'package:mvmm_auth_demo/domain/usecase/logout_usecase.dart';
import 'package:mvmm_auth_demo/presentation/controller/app/bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initAppModule() async {
  var cache = await SharedPreferences.getInstance();
  injector.registerLazySingleton<Repository>(
    () => AuthenticationRepository(cache: cache),
  );

  injector.registerLazySingleton<UserChannel>(
    () => UserChannel(repository: injector<Repository>()),
  );

  injector.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(injector<Repository>()),
  );

  injector.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(
      injector<Repository>(),
    ),
  );

  injector.registerLazySingleton<AppBloc>(
    () => AppBloc(
      userChannel: injector<UserChannel>(),
      logoutUseCase: injector<LogoutUseCase>(),
    ),
  );
}

//Backup
//Future<void> oldAppModule() async {
// network info
// instance.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImpl(InternetConnection()));

// // dio factory
// instance.registerLazySingleton<DioFactory>(() => DioFactory());

// // app  service client
// final dio = await instance<DioFactory>().getDio();
// instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

// // remote data source
// instance.registerLazySingleton<DataSource>(
//     () => RemoteDateSource(appServiceClient: instance()));

// // repository
// instance.registerLazySingleton<Repository>(
//     () => RepositoryImpl(instance(), instance()));
//}

initLoginModule() {
  // if (!GetIt.I.isRegistered<LoginUseCase>()) {
  //   instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  //   //  instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  // }
}
