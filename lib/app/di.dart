import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvmm_auth_demo/app/service/dio_factory.dart';
import 'package:mvmm_auth_demo/data/api/datasource/app_api.dart';
import 'package:mvmm_auth_demo/data/api/repository/repository_impl.dart';
import 'package:mvmm_auth_demo/data/firebase/repository/repository_impl.dart';
import 'package:mvmm_auth_demo/domain/channels/user_channel.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:mvmm_auth_demo/domain/usecase/login_usecase.dart';
import 'package:mvmm_auth_demo/domain/usecase/logout_usecase.dart';
import 'package:mvmm_auth_demo/domain/usecase/signup_usercase.dart';
import 'package:mvmm_auth_demo/firebase_options.dart';
import 'package:mvmm_auth_demo/presentation/controller/app/bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

final injector = GetIt.instance;

Future<void> initAppModule({required bool useFirebase}) async {
  var cache = await SharedPreferences.getInstance();
  injector.registerLazySingleton<SharedPreferences>(() => cache);

  if (useFirebase) {
    await initFirebaseDatasource();
  } else {
    await initMockAPIDatasource();
  }

  injector.registerLazySingleton<UserChannel>(
    () => UserChannel(
      repository: injector<Repository>(),
      cache: injector<SharedPreferences>(),
    ),
  );

  injector.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(
      injector<Repository>(),
    ),
  );
}

Future<void> initFirebaseDatasource() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  injector.registerLazySingleton<Repository>(
    () => FirebaseAuthRepository(cache: injector<SharedPreferences>()),
  );
}

Future<void> initMockAPIDatasource() async {
  Dio dio = await DioFactory().getDio();
  injector.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  injector.registerLazySingleton<Repository>(() => APIAuthRepository(
        api: injector<AppServiceClient>(),
        cache: injector<SharedPreferences>(),
      ));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    injector.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(injector<Repository>()),
    );
  }
}

initSignupModule() {
  if (!GetIt.I.isRegistered<SignupUseCase>()) {
    injector.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(injector<Repository>()),
    );
  }
}
