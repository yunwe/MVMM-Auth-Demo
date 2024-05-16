import 'dart:async';

import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserChannel {
  UserChannel({
    required this.repository,
    required this.cache,
  });

  final Repository repository;
  final SharedPreferences cache;

  Stream<User> get user => repository.user;
}
