import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';
import 'package:mvmm_auth_demo/presentation/_resources/values.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/form_container.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/gradient_container.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/link_text.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
            //          SharedWidgets.whiteSpace,
            const Divider(),
            const LinkText(
              routeName: Routes.signin,
              text: AppStrings.signinText,
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
                AppStrings.titleRegister,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              //      SharedWidgets.getTextFormField(Icons.person, AppStrings.hintUserName),
              //     SharedWidgets.getTextFormField(Icons.lock, AppStrings.hintPw),
              //   SharedWidgets.getTextFormField(Icons.lock, AppStrings.hintConfirmPw),
              // SharedWidgets.getButton(onPressed: () {}, label: AppStrings.labelSignup),
            ],
          ),
        ),
      );
}
