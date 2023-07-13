import 'package:dartz/dartz.dart';
import 'package:tut_store_app/business/data/mappers/mapper.dart';
import 'package:tut_store_app/business/data/network/failure.dart';
import 'package:tut_store_app/business/data/network/network_info_checker.dart';
import 'package:tut_store_app/business/data/remote_data_sources/remote_data_sources.dart';
import 'package:tut_store_app/business/data/requests/login_request.dart';
import 'package:tut_store_app/business/domain/models/authentication_model.dart';
import 'package:tut_store_app/business/domain/repository/repository.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;
  RepositoryImplementer({required this.remoteDataSources, required this.networkInfo,});
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
  
    try {

    if(await networkInfo.isConnected){
  final result = await remoteDataSources.login(loginRequest);
  return right(Authentication(contacts: result.contacts.toDomain(), customer: result.customer.toDomain(),));
    }
    else{
      return left(Failure(code: code, message: message),);
    }
    }catch{}
  }
}
