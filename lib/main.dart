import 'package:flutter/material.dart';
import 'package:mvmm_auth_demo/app/di.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule(useFirebase: true);
  runApp(const App());
}
