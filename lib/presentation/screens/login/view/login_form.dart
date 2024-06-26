import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mvmm_auth_demo/app/route/route_utils.dart';
import 'package:mvmm_auth_demo/presentation/resources/resources.dart';
import 'package:mvmm_auth_demo/presentation/screens/common_widgets/widgets.dart';
import 'package:mvmm_auth_demo/presentation/screens/login/bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.failure.message)),
            );
        }
      },
      child: formContent(context),
    );
  }

  Widget formContent(BuildContext context) => FormContainerWidget(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.titleSignin,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            spaceP20,
            _UsernameInput(),
            spaceP20,
            _PasswordInput(),
            spaceP20,
            _LoginButton(),
            spaceP8,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCheckbox(label: AppStrings.rememberMe),
                LinkText(
                  page: PAGES.forgotpassword,
                  text: AppStrings.forgotPassword,
                ),
              ],
            ),
          ],
        ),
      );

  Widget get spaceP20 => const SizedBox(
        height: AppPadding.p20,
      );

  Widget get spaceP8 => const SizedBox(
        height: AppPadding.p8,
      );
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          return MyTextField(
            Icons.person,
            AppStrings.hintUserName,
            key: AppKeys.loginUsername,
            onChanged: (username) => context.read<LoginBloc>().add(
                  LoginUsernameChanged(username),
                ),
            errorText: state.username.displayError?.text(),
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return MyTextField(
            Icons.lock,
            AppStrings.hintPw,
            key: AppKeys.loginPassword,
            onChanged: (password) => context.read<LoginBloc>().add(
                  LoginPasswordChanged(password),
                ),
            obscureText: true,
            errorText: state.password.displayError?.text(),
          );
        });
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : MyButton(
                key: AppKeys.loginSubmit,
                onPressed: state.isValid
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                label: AppStrings.labelLogin,
              );
      },
    );
  }
}
