import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvmm_auth_demo/app/di.dart';
import 'package:mvmm_auth_demo/data/auth/repository/repository_implementer.dart';
import 'package:mvmm_auth_demo/presentation/controller/app/bloc/app_bloc.dart';
import 'package:mvmm_auth_demo/presentation/screens/login/login.dart';
import 'route_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: PAGES.home.screenPath,
        name: PAGES.home.screenName,
        //TODO: fill here
        // builder: (context, state) => BlocProvider(
        //   create: (context) => injector<AppBloc>(),
        //   child: const HomeScreen(),
        // ),
      ),
      GoRoute(
        path: PAGES.signin.screenPath,
        name: PAGES.signin.screenName,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorBuilder: (context, state) => const _NoPageFound(),
    redirect: (context, state) async {
      // Here we need to read the context `context.read()` and decide what to do with its new values. we don't want to trigger any new rebuild through `context.watch`
      final status = context.read<AppBloc>().state.status;
      if (status == AppStatus.authenticated) {
        return null;
      }
      return PAGES.signin.screenPath;
    },
  );

  static GoRouter get router => _router;
}

class _NoPageFound extends StatelessWidget {
  const _NoPageFound();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Route not found!'),
      ),
    );
  }
}