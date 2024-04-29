import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Forget Password View'),
          TextButton(
            onPressed: () {},
            child: Text(AppStrings.signinText),
          ),
        ],
      ),
    );
  }
}
