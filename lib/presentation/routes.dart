import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/forget_password/forget_password.dart';
import 'package:mvmm_auth_demo/presentation/login/login.dart';
import 'package:mvmm_auth_demo/presentation/register/register.dart';

class Routes {
  static const String signin = 'signin';
  static const String register = 'register';
  static const String recover = 'forgetpassword';
}

class RouteParams {
  static const String paramId = 'id';
}

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: Routes.signin,
      builder: (BuildContext context, GoRouterState state) => const LoginView(),
      routes: <RouteBase>[
        GoRoute(
          path: Routes.register,
          name: Routes.register,
          builder: (BuildContext context, GoRouterState state) => const RegisterView(),
        ),
        GoRoute(
          path: Routes.recover,
          name: Routes.recover,
          builder: (BuildContext context, GoRouterState state) => const ForgetPasswordView(),
        )
      ],
    ),
  ],
);
