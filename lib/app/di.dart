import 'package:get_it/get_it.dart';
import 'package:mvmm_auth_demo/data/auth/repository/repository_implementer.dart';
import 'package:mvmm_auth_demo/presentation/controller/app/bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:mvmm_auth_demo/data/data_source/data_source.dart';
// import 'package:mvmm_auth_demo/data/data_source/remote_data_source.dart';
// import 'package:mvmm_auth_demo/data/network/app_api.dart';
// import 'package:mvmm_auth_demo/data/network/dio_factory.dart';
// import 'package:mvmm_auth_demo/data/network/network_info.dart';
// import 'package:mvmm_auth_demo/data/repository/repository_impl.dart';
// import 'package:mvmm_auth_demo/domain/repository/repository.dart';
// import 'package:mvmm_auth_demo/domain/usecase/login_usecase.dart';

final injector = GetIt.instance;

Future<void> initAppModule() async {
  var cache = await SharedPreferences.getInstance();
  injector.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepository(cache: cache),
  );

  injector.registerLazySingleton<AppBloc>(
    () => AppBloc(
      authenticationRepository: injector<AuthenticationRepository>(),
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
