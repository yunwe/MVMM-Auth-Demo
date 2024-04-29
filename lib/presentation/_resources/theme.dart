import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: MyColors.primary,
    ),
  );
}
