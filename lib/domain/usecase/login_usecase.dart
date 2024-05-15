import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:mvmm_auth_demo/data/firebase/repository/exceptions.dart';
import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:mvmm_auth_demo/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, void> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(LoginUseCaseInput input) async {
    try {
      await _repository.signIn(email: input.email, password: input.password);
      return const Right(null);
    } catch (error) {
      var failure =
          const Failure('Default Error Message'); //Todo: Change String
      if (error is LogInWithEmailAndPasswordFailure) {
        failure = Failure(error.message);
      }

      return Left(failure);
    }
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
