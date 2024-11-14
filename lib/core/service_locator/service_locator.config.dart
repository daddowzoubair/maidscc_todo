// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/authentication/data/data_sources/local/authentication_local_data_source.dart'
    as _i289;
import '../../features/authentication/data/data_sources/remote/authentication_remote_data_source.dart'
    as _i873;
import '../../features/authentication/data/repositories/authentication_reporsitory_imp.dart'
    as _i1050;
import '../../features/authentication/data/repositories/authentication_repository.dart'
    as _i914;
import '../../features/authentication/presentation/controller/authentication_bloc.dart'
    as _i949;
import '../../features/todos/data/data_source/local/todos_local_data_source.dart'
    as _i969;
import '../../features/todos/data/data_source/remote/todos_remote_data_source.dart'
    as _i423;
import '../../features/todos/data/repositories/authentication_reporsitory_imp.dart'
    as _i653;
import '../../features/todos/data/repositories/todos_repository.dart' as _i564;
import '../network/clients/api_client.dart' as _i462;
import '../network/clients/dio_client.dart' as _i466;
import '../network/interceptors/dio_interceptor.dart' as _i928;
import '../utils/shared_pref.dart' as _i979;
import 'register_services_module.dart' as _i207;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerServicesModule = _$RegisterServicesModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerServicesModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i466.DioClient>(() => registerServicesModule.dioClient);
  gh.lazySingleton<_i462.ApiClient>(() => registerServicesModule.apiClient);
  gh.lazySingleton<_i928.DioInterceptor>(() => _i928.DioInterceptor());
  gh.lazySingleton<_i949.AuthenticationBloc>(() => _i949.AuthenticationBloc());
  gh.lazySingleton<_i423.TodosRemoteDataSource>(
      () => _i423.TodosRemoteDataSource(gh<_i462.ApiClient>()));
  gh.lazySingleton<_i873.AuthenticationRemoteDataSource>(
      () => _i873.AuthenticationRemoteDataSource(gh<_i462.ApiClient>()));
  gh.lazySingleton<_i969.TodosLocalDataSource>(
      () => _i969.TodosLocalDataSource(gh<_i979.SharedPreferencesStorage>()));
  gh.lazySingleton<_i289.AuthenticationLocalDataSource>(() =>
      _i289.AuthenticationLocalDataSource(
          gh<_i979.SharedPreferencesStorage>()));
  gh.lazySingleton<_i564.TodosRepository>(() => _i653.TodosRepositoryImp(
        gh<_i423.TodosRemoteDataSource>(),
        gh<_i969.TodosLocalDataSource>(),
      ));
  gh.lazySingleton<_i914.AuthenticationRepository>(
      () => _i1050.AuthenticationRepositoryImp(
            gh<_i873.AuthenticationRemoteDataSource>(),
            gh<_i289.AuthenticationLocalDataSource>(),
          ));
  gh.lazySingleton<_i979.SharedPreferencesStorage>(
      () => _i979.SharedPreferencesStorage(gh<_i460.SharedPreferences>()));
  return getIt;
}

class _$RegisterServicesModule extends _i207.RegisterServicesModule {}
