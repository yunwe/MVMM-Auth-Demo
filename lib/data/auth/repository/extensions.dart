import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:mvmm_auth_demo/domain/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension FirebaseUserMapperExtension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

extension UserCacheing on User {
  static User? load(SharedPreferences cache, String key) {
    List<String>? values = cache.getStringList(key);
    if (values == null || values.length != 4) {
      return null;
    }

    return User(id: values[0], email: values[1], name: values[2], photo: values[3]);
  }

  void writeCache(SharedPreferences cache, String key) {
    List<String> values = [id, email ?? '', name ?? '', photo ?? ''];
    cache.setStringList(key, values);
  }
}
