import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:maidscc_todos/core/service_locator/service_locator.dart';
import 'package:maidscc_todos/core/utils/shared_pref.dart';
import 'package:maidscc_todos/features/authentication/data/entities/login/login_model.dart';
import 'package:maidscc_todos/features/authentication/data/entities/user_info/user_info_model.dart';

import '../data_sources/remote/authentication_remote_data_source.dart';
import 'authentication_repository.dart';


@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImp extends AuthenticationRepository {
  AuthenticationRepositoryImp(
    this.authenticationRemoteDataSource,
  );

  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  @override
  Future<LoginModel> login({required String userName, required String password}) async {
    final response = await authenticationRemoteDataSource.login(userName: userName, password: password);

    if(response.message.isEmpty && response.accessToken.isNotEmpty){
      await getIt<SharedPreferencesStorage>().setAccessToken(response.accessToken);
      await getIt<SharedPreferencesStorage>().setRefreshToken(response.refreshToken);
    }
    
    return response;
  }

  @override
  Future<UserInfoModel> userInfo() async {
    final response = await authenticationRemoteDataSource.userInfo();

    return response;
  }
  
  @override
  Future<LoginModel> refreshToken() async {
    
    final response = await authenticationRemoteDataSource.refreshToken(refreshToken: getIt<SharedPreferencesStorage>().accessToken);

    if(response.message.isEmpty && response.accessToken.isNotEmpty){
      await getIt<SharedPreferencesStorage>().setAccessToken(response.accessToken);
      await getIt<SharedPreferencesStorage>().setRefreshToken(response.refreshToken);
    }
    
    return response;
  }


}
