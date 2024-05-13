import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:mvmm_auth_demo/data/auth/repository/exceptions.dart';
import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:mvmm_auth_demo/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, User> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(LoginUseCaseInput input) async {
    try {
      await _repository.signIn(email: input.email, password: input.password);

      //Todo: Read user
      return const Right(User.empty);
    } on LogInWithEmailAndPasswordFailure catch (error) {
      return Left(
        Failure(error.message),
      );
    }
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
