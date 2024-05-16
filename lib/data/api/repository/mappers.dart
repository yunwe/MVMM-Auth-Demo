import 'package:mvmm_auth_demo/data/api/datasource/models/models.dart';
import 'package:mvmm_auth_demo/domain/model/models.dart';

extension UserMapper on AuthenticationResponse {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    if (status == APIInternalStatus.fail.statusCode) {
      return User.empty;
    }

    if (user == null) {
      return User.empty;
    }

    return User(
      id: user!.id ?? '',
      email: contacts?.email ?? '',
      name: user!.name,
      photo: user!.photo,
    );
  }
}
