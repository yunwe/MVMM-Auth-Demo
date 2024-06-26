import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/app/route/route_utils.dart';
import 'package:mvmm_auth_demo/presentation/resources/resources.dart';
import 'package:mvmm_auth_demo/presentation/screens/common_widgets/widgets.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
            //     SharedWidgets.whiteSpace,
            const Divider(),
            const LinkText(
              page: PAGES.signin,
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
                AppStrings.titleForgotPw,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              //   SharedWidgets.getTextFormField(Icons.person, AppStrings.hintEmail),
              //   SharedWidgets.getButton(onPressed: () {}, label: AppStrings.labelReset),
            ],
          ),
        ),
      );
}
