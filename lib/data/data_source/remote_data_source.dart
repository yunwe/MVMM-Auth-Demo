import 'package:mvmm_auth_demo/data/data_source/data_source.dart';
import 'package:mvmm_auth_demo/data/network/app_api.dart';
import 'package:mvmm_auth_demo/data/request/request.dart';
import 'package:mvmm_auth_demo/data/responses/responses.dart';

class RemoteDateSource implements DataSource {
  AppServiceClient appServiceClient;

  RemoteDateSource({required this.appServiceClient});

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
      loginRequest.imei,
      loginRequest.deviceType,
    );
  }
}
