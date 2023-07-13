import 'package:flutter/material.dart' show immutable;
import 'package:tut_store_app/business/data/network/app_api.dart';
import 'package:tut_store_app/business/data/requests/login_request.dart';
import 'package:tut_store_app/business/data/responses/authentication_responses.dart';

@immutable
abstract class RemoteDataSources {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourcesImplementer implements RemoteDataSources {
  final AppServiceClient appServiceClient;
  RemoteDataSourcesImplementer({
    required this.appServiceClient,
  });
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async =>
      await appServiceClient.login(
        email: loginRequest.email,
        password: loginRequest.password,
        imei: loginRequest.imei,
        deviceType: loginRequest.deviceType,
      );
}
