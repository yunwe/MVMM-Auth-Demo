import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/colors.dart';

class GradientContainerWidget extends StatelessWidget {
  final Widget content;

  const GradientContainerWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            MyColors.backgroundGradient,
          ],
        ),
      ),
      child: content,
    );
  }
}
