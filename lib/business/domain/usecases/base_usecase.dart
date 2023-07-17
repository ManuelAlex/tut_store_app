import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:tut_store_app/business/data/network/failure.dart';

@immutable
abstract class BaseUsecase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
