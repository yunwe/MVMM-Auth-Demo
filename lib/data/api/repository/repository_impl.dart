import 'package:mvmm_auth_demo/domain/model/user.dart';
import 'package:mvmm_auth_demo/domain/repository/repository.dart';

class APIAuthRepository extends Repository {
  @override
  // TODO: implement currentUser
  User get currentUser => throw UnimplementedError();

  @override
  Future<void> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
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

  @override
  // TODO: implement user
  Stream<User> get user => throw UnimplementedError();
}
