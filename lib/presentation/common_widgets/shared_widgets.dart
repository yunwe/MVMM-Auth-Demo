import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/values.dart';

class SharedWidgets {
  static const whiteDivider = Divider(
    indent: 50,
    endIndent: 50,
    thickness: 2,
    color: Colors.white,
  );

  static const whiteSpace = SizedBox(
    height: 40,
  );

  static Widget getTextFormField(
    IconData icon,
    String hint, {
    Key? key,
    String? errorText,
    void Function(String)? onChange,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: TextFormField(
          key: key,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            prefixIcon: Icon(
              icon,
              size: AppSize.iconSize,
            ),
          ),
        ),
      );

  static Widget getButton({
    required void Function()? onPressed,
    required String label,
    Key? key,
    double? width,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: SizedBox(
          width: width ?? double.infinity,
          height: AppSize.formEntityHeight,
          child: ElevatedButton(
            key: key,
            onPressed: onPressed,
            child: Text(label),
          ),
        ),
      );
}
