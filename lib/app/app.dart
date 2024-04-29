import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/presentation/_resources/theme.dart';
import 'package:mvmm_auth_demo/presentation/routes.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance = MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: getApplicationTheme(),
    );
  }
}
