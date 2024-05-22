import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvmm_auth_demo/app/di.dart';
import 'package:mvmm_auth_demo/app/route/route_utils.dart';
import 'package:mvmm_auth_demo/domain/usecase/signup_usercase.dart';
import 'package:mvmm_auth_demo/presentation/resources/resources.dart';
import 'package:mvmm_auth_demo/presentation/screens/common_widgets/widgets.dart';
import 'package:mvmm_auth_demo/presentation/screens/register/register.dart';
import 'package:mvmm_auth_demo/presentation/screens/register/view/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  create: (context) => RegisterBloc(
                    useCase: injector<SignupUseCase>(),
                  ),
                  child: const RegisterForm(),
                ),

                //          SharedWidgets.whiteSpace,
                const Divider(),
                const LinkText(
                  page: PAGES.signin,
                  text: AppStrings.signinText,
                ),
              ],
            ),
          ),
        ));
  }
}
