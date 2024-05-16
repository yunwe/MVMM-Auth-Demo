import 'dart:async';

import 'package:mvmm_auth_demo/app/service/network_info.dart';
import 'package:mvmm_auth_demo/data/api/datasource/app_api.dart';
import 'package:mvmm_auth_demo/data/api/datasource/models/models.dart';
import 'package:mvmm_auth_demo/data/api/repository/mappers.dart';
import 'package:mvmm_auth_demo/domain/model/user.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';

class APIAuthRepository extends Repository {
  final AppServiceClient _api;
  final StreamController<User> _controller;
  final NetworkInfo _networkInfo;

  APIAuthRepository({required AppServiceClient api})
      : _api = api,
        _networkInfo = NetworkInfo(),
        _controller = StreamController<User>();

  @override
  Stream<User> get user => _controller.stream;

  @override
  // TODO: implement currentUser
  User get currentUser => throw UnimplementedError();

  @override
  Future<void> signIn({required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        AuthenticationResponse response =
            await _api.login(email, password, '', '');

        if (response.status == APIInternalStatus.success.statusCode) {
          // return data (success)
          User user = response.toUser;
          _controller.sink.add(user);
        } else {
          // return biz logic error
          // return left
          throw 'Failure(response.status ?? APIInternalStatus.fail.statusCode, response.message ?? ErrorStrings.DEFAULT))';
        }
      } catch (error) {
        throw 'ErrorHandler.handle(error).failure';
      }
    } else {
      // return connection error
      throw 'DefinedError.NO_INTERNET_CONNECTION.failure';
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
