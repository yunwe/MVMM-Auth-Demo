import 'package:mvmm_auth_demo/data/request/request.dart';
import 'package:mvmm_auth_demo/data/responses/responses.dart';

abstract class DataSource {
  Future<AuthenticationResponse> login(LoginRequest request);
}
