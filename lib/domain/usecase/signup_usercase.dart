import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:mvmm_auth_demo/data/firebase/repository/exceptions.dart';
import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:mvmm_auth_demo/domain/usecase/base_usecase.dart';

class SignupUseCase implements BaseUseCase<SignupUseCaseInput, void> {
  final Repository _repository;

  SignupUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(SignupUseCaseInput input) async {
    try {
      await _repository.signUp(email: input.email, password: input.password);
      return const Right(null);
    } catch (error) {
      var failure =
          const Failure('Default Error Message'); //Todo: Change String
      if (error is SignUpWithEmailAndPasswordFailure) {
        failure = Failure(error.message);
      }

      return Left(failure);
    }
  }
}

class SignupUseCaseInput {
  String email;
  String password;

  SignupUseCaseInput(this.email, this.password);
}
