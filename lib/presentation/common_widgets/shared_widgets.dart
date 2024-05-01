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

  static Widget getTextFormField(IconData icon, String hint) => Padding(
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

  static Widget getButton(
          {required void Function()? onPressed, required String label}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: SizedBox(
          width: double.infinity,
          height: AppSize.formEntityHeight,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(label),
          ),
        ),
      );
}
