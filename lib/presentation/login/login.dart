import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/data/network/failure.dart';
import 'package:mvmm_auth_demo/data/repository/repository_impl.dart';
import 'package:mvmm_auth_demo/data/request/request.dart';
import 'package:mvmm_auth_demo/domain/model/model.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';

import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';
import 'package:mvmm_auth_demo/presentation/_resources/values.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/shared_widgets.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/form_container.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/gradient_container.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/link_text.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/my_checkbox.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  void doLogin() async {
    // Repository repo = RepositoryImpl();
    // LoginRequest request = LoginRequest('abc', '123456', '', '');
    // Either<Failure, Authentication> value = await repo.login(request);

    // if (value.isLeft) {
    //   print(value.left.toString());
    // } else {
    //   print(value.right.customer.name);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: mainContent(context),
    );
  }

  Widget mainContent(BuildContext context) {
    return GradientContainerWidget(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formContent(context),
            SharedWidgets.whiteSpace,
            SharedWidgets.whiteDivider,
            const LinkText(
              routeName: Routes.register,
              text: AppStrings.registerText,
            ),
          ],
        ),
      ),
    );
  }

  Widget formContent(BuildContext context) => FormContainerWidget(
        content: SizedBox(
          width: AppSize.formEntityWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.titleSignin,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SharedWidgets.getTextFormField(Icons.person, AppStrings.hintUserName),
              SharedWidgets.getTextFormField(Icons.lock, AppStrings.hintPw),
              SharedWidgets.getButton(onPressed: doLogin, label: AppStrings.labelLogin),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCheckbox(label: AppStrings.rememberMe),
                  LinkText(
                    routeName: Routes.recover,
                    text: AppStrings.forgotPassword,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
