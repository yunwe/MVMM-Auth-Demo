import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvmm_auth_demo/app/di.dart';
import 'package:mvmm_auth_demo/domain/usecase/login_usecase.dart';
import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/common_widgets.dart';
import 'package:mvmm_auth_demo/presentation/login/bloc/login_bloc.dart';
import 'package:mvmm_auth_demo/presentation/login/view/login_form.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: GradientContainerWidget(
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocProvider(
                create: (context) {
                  return LoginBloc(
                    useCase: instance<LoginUseCase>(),
                  );
                },
                child: const LoginForm(),
              ),
              space,
              const Divider(),
              const LinkText(
                routeName: Routes.register,
                text: AppStrings.registerText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get space => const SizedBox(
        height: 40,
      );
}
