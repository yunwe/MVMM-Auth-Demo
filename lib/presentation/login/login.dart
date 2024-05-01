import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mvmm_auth_demo/presentation/_resources/app_strings.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';
import 'package:mvmm_auth_demo/presentation/_resources/values.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/const_widgets.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/form_container.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/gradient_container.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/link_text.dart';
import 'package:mvmm_auth_demo/presentation/common_widgets/my_checkbox.dart';
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
    return GradientContainerWidget(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formContent,
            whiteSpace,
            whiteDivider,
            const LinkText(
              routeName: Routes.register,
              text: AppStrings.registerText,
            ),
          ],
        ),
      ),
    );
  }

  Widget get formContent => FormContainerWidget(
        content: SizedBox(
          width: AppSize.formEntityWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(AppStrings.signinTitle),
              getTextFormField(Icons.person, AppStrings.userName),
              getTextFormField(Icons.lock, AppStrings.password),
              loginButton,
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

  Widget getTextFormField(IconData icon, String hint) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              size: AppSize.iconSize,
            ),
          ),
        ),
      );

  Widget get loginButton => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: SizedBox(
          width: double.infinity,
          height: AppSize.formEntityHeight,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(AppStrings.login),
          ),
        ),
      );
}
