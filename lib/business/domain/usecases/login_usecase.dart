import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:tut_store_app/app_core/functions.dart';
import 'package:tut_store_app/business/data/network/failure.dart';
import 'package:tut_store_app/business/data/requests/login_request.dart';
import 'package:tut_store_app/business/domain/models/authentication_model.dart';
import 'package:tut_store_app/business/domain/repository/repository.dart';
import 'package:tut_store_app/business/domain/usecases/base_usecase.dart';

class LoginUsecase extends BaseUsecase<LoginUseCaseInput, Authentication> {
  final Repository repository;
  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    final deviceInfo = await getDeviceInfo();
    return await repository.login(
      LoginRequest(
        email: input.email,
        password: input.password,
        imei: deviceInfo.identifier,
        deviceType: deviceInfo.name,
      ),
    );
  }
}

@immutable
class LoginUseCaseInput {
  final String email;
  final String password;

  const LoginUseCaseInput({required this.email, required this.password});
}
