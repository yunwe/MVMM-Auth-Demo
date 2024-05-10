import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/resources/values.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
    this.icon,
    this.hint, {
    super.key,
    this.errorText,
    this.onChanged,
    this.obscureText = false,
  });

  final IconData icon;
  final String hint;
  final String? errorText;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorText,
        prefixIcon: Icon(
          icon,
          size: AppSize.iconSize,
        ),
      ),
      obscureText: true,
      style: const TextStyle(
        fontSize: FontSize.inputFontSize,
        color: Colors.black87,
      ),
    );
  }
}
