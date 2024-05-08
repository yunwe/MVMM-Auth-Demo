import 'package:either_dart/either.dart';
import 'package:mvmm_auth_demo/data/data_source/data_source.dart';
import 'package:mvmm_auth_demo/data/mapper/mapper.dart';
import 'package:mvmm_auth_demo/data/network/error_handler.dart';
import 'package:mvmm_auth_demo/data/network/failure.dart';
import 'package:mvmm_auth_demo/data/network/network_info.dart';
import 'package:mvmm_auth_demo/data/request/request.dart';
import 'package:mvmm_auth_demo/domain/model/model.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  DataSource _dataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _dataSource.login(loginRequest);

        if (response.status == APIInternalStatus.success.statusCode) // success
        {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          return Left(Failure(response.status ?? APIInternalStatus.fail.statusCode, response.message ?? ErrorStrings.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DefinedError.NO_INTERNET_CONNECTION.failure);
    }
  }
}
