import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String routeName;

  const LinkText({super.key, required this.routeName, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(routeName);
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
