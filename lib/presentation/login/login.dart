import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';
import 'package:mvmm_auth_demo/presentation/_resources/values.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: mainContent(context),
    );
  }

  Widget mainContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            MyColors.backgroundGradient,
          ],
        ),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.border_radius),
            ),
            color: Colors.white.withOpacity(AppSize.opacity),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
          ),
        ),
      ),
    );
  }
}
