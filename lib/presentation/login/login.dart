import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContent(context),
    );
  }

  Widget mainContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Login View'),
        TextButton(
          onPressed: () {
            context.goNamed(Routes.recover);
          },
          child: const Text(AppStrings.forgetPassword),
        ),
        TextButton(
          onPressed: () {
            context.goNamed(Routes.register);
          },
          child: const Text(AppStrings.registerText),
        )
      ],
    );
  }
}
