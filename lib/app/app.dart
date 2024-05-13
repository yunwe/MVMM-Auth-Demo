import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvmm_auth_demo/app/di.dart';
import 'package:mvmm_auth_demo/app/route/app_router.dart';
import 'package:mvmm_auth_demo/app/route/route_utils.dart';
import 'package:mvmm_auth_demo/data/auth/repository/repository_implementer.dart';
import 'package:mvmm_auth_demo/presentation/controller/app/bloc/app_bloc.dart';
import 'package:mvmm_auth_demo/presentation/resources/resources.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(
        authenticationRepository: injector<AuthenticationRepository>(),
      ),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: getApplicationTheme(),
      builder: (context, child) {
        return BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            switch (state.status) {
              case AppStatus.authenticated:
                AppRouter.router.goNamed(PAGES.home.screenName);
              case AppStatus.unauthenticated:
              default:
                AppRouter.router.goNamed(PAGES.signin.screenName);
            }
          },
          child: child,
        );
      },
    );
  }
}
