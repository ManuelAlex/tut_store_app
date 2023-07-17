import 'package:dartz/dartz.dart';
import 'package:tut_store_app/business/data/mappers/mapper.dart';
import 'package:tut_store_app/business/data/network/failure.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/error_message.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/get_failure_extention.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/networ_status.dart';
import 'package:tut_store_app/business/data/network/network_error_handler/network_error_handler.dart';
import 'package:tut_store_app/business/data/network/network_info_checker.dart';
import 'package:tut_store_app/business/data/remote_data_sources/remote_data_sources.dart';
import 'package:tut_store_app/business/data/requests/login_request.dart';
import 'package:tut_store_app/business/domain/models/authentication_model.dart';
import 'package:tut_store_app/business/domain/repository/repository.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;
  RepositoryImplementer({
    required this.remoteDataSources,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      //its safe to make the call

      // return right(Authentication(contacts: result.contacts.toDomain(), customer: result.customer.toDomain(),));
      try {
        final response = await remoteDataSources.login(loginRequest);
        if (response.status == ApiInternalStatusCode.success) {
          //return authResponse
          return right(
            response.toDomain(),
          );
        } else {
          //return failure object
          return left(
            Failure(
              code: response.status ?? ApiInternalStatusCode.failure,
              message: response.message ?? ResponseMessage.unknownError,
            ),
          );
        }
      } catch (error) {
        // catch unknown error
        return left(Errorhandler.handle(error: error).failure);
      }
    } else {
      // error in network connection
      return left(
        NetworkResponseStatus.noInternetConnection.getFailure(),
      );
    }
  }
}
