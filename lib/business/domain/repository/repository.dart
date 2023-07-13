import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart' show immutable;
import 'package:tut_store_app/business/data/network/failure.dart';
import 'package:tut_store_app/business/data/requests/login_request.dart';
import 'package:tut_store_app/business/domain/models/authentication_model.dart';

@immutable
//this is a interceptor bw the results from authrespons and filters to failure and Auth Object
abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
