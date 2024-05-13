import 'package:either_dart/either.dart';
import 'package:mvmm_auth_demo/data/auth/repository/exceptions.dart';
import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';
import 'package:mvmm_auth_demo/domain/usecase/base_usecase.dart';

class LogoutUseCase implements BaseUseCase<LogoutUseCaseInput, bool> {
  final Repository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(LogoutUseCaseInput input) async {
    try {
      await _repository.signOut();
      return const Right(true);
    } on LogOutFailure catch (error) {
      return Left(
        Failure(error.message),
      );
    }
  }
}

class LogoutUseCaseInput {}
