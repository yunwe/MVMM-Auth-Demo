import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mvmm_auth_demo/app/service/network_info.dart';
import 'package:mvmm_auth_demo/data/api/datasource/app_api.dart';
import 'package:mvmm_auth_demo/data/api/datasource/models/models.dart';
import 'package:mvmm_auth_demo/data/api/repository/exceptions/exceptions.dart';
import 'package:mvmm_auth_demo/data/api/repository/mappers.dart';
import 'package:mvmm_auth_demo/domain/model/user.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIAuthRepository extends Repository {
  final AppServiceClient _api;
  final StreamController<User> _controller;
  final NetworkInfo _networkInfo;
  final SharedPreferences cache;

  APIAuthRepository({
    required AppServiceClient api,
    required this.cache,
  })  : _api = api,
        _networkInfo = NetworkInfo(),
        _controller = StreamController<User>();

  @override
  Stream<User> get user => _controller.stream;

  @override
  Future<void> signIn({required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        AuthenticationResponse response = await _api.login(email, password, '', '');

        if (response.status == APIInternalStatus.success.statusCode) {
          updateCurrentUser(response.toUser);
        } else {
          throw DomainLogicFailure.fromRespnse(response);
        }
      } on DioException catch (error) {
        throw DioExceptionsFailure.fromDio(error);
      } catch (error) {
        throw const DioExceptionsFailure();
      }
    } else {
      // return connection error
      throw const ConnectionFailure();
    }
  }

  @override
  Future<void> signOut() async {
    updateCurrentUser(User.empty);
    return;
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  void updateCurrentUser(User user) {
    user.writeCache(cache);
    _controller.sink.add(user);
  }
}
