import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_store_app/app_core/app_preference.dart';
import 'package:tut_store_app/app_core/constants.dart';
import 'package:tut_store_app/business/data/network/app_api.dart';
import 'package:tut_store_app/business/data/network/dio_factory.dart';
import 'package:tut_store_app/business/data/network/network_info_checker.dart';
import 'package:tut_store_app/business/data/remote_data_sources/remote_data_sources.dart';
import 'package:tut_store_app/business/data/repository/repository_implememter.dart';
import 'package:tut_store_app/business/domain/repository/repository.dart';
import 'package:tut_store_app/business/domain/usecases/login_usecase.dart';
import 'package:tut_store_app/logic/bloc/login/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginBloc(
        loginUsecase: sl(),
      ));
  sl.registerLazySingleton(
    () => LoginUsecase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<Repository>(
    () => RepositoryImplementer(
      remoteDataSources: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteDataSources>(
    () => RemoteDataSourcesImplementer(
      appServiceClient: sl<AppServiceClient>(),
    ),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetWorkInfoImplementer(
      dataConnectionChecker: sl(),
    ),
  );
  sl.registerLazySingleton(
      () => DioFactory(appPreferences: sl<AppPreferences>()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(
    () => AppPreferences(
      sharedPreferences: sharedPreferences,
    ),
  );
  final dioFactory = sl<DioFactory>();
  final dio = await dioFactory.getDio();
  sl.registerLazySingleton(
      () => AppServiceClient(dio, baseUrl: Constant.baseUrl));

  sl.registerLazySingleton(
    () => DataConnectionChecker(),
  );
}
