import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Register View'),
          TextButton(
            onPressed: () {
              context.goNamed(Routes.recover);
            },
            child: const Text(AppStrings.forgetPassword),
          ),
          TextButton(
            onPressed: () {
              context.goNamed(Routes.signin);
            },
            child: const Text(AppStrings.signinText),
          )
        ],
      ),
    );
  }
}
