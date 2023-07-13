import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tut_store_app/app_core/constants.dart';
import 'package:tut_store_app/business/data/responses/authentication_responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {required final String baseUrl}) =
      _AppServiceClient;

  @POST('/customers/login')
  Future<AuthenticationResponse> login({
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("imei") required String imei,
    @Field("deviceType") required String deviceType,
  });
}
