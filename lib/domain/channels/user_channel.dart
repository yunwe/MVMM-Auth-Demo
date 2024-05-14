import 'dart:async';

import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';

class UserChannel {
  UserChannel({required this.repository});

  final Repository repository;

  User get cachedUser {
    return repository.currentUser;
  }

  Stream<User> get user => repository.user;
}
