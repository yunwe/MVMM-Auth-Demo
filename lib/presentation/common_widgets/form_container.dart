import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/values.dart';

class FormContainerWidget extends StatelessWidget {
  const FormContainerWidget({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.borderRadius),
        ),
        color: Colors.white.withOpacity(AppSize.opacity),
      ),
      padding: const EdgeInsets.all(AppPadding.p28),
      child: SingleChildScrollView(child: content),
    );
  }
}
