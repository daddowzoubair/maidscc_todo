import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:maidscc_todos/features/authentication/data/entities/login/login_model.dart';
import 'package:maidscc_todos/features/authentication/data/entities/user_info/user_info_model.dart';

import '../data_sources/local/authentication_local_data_source.dart';
import '../data_sources/remote/authentication_remote_data_source.dart';
import 'authentication_repository.dart';


@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImp extends AuthenticationRepository {
  AuthenticationRepositoryImp(
    this.authenticationRemoteDataSource,
    this.authenticationLocalDataSource
  );

  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  @override
  Future<LoginModel> login({required String userName, required String password}) async {
    final response = await authenticationRemoteDataSource.login(userName: userName, password: password);

    if(response.message.isEmpty && response.accessToken.isNotEmpty){
      await authenticationLocalDataSource.setAccessToken(response.accessToken);
      await authenticationLocalDataSource.setRefreshToken(response.refreshToken);
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
    
    final response = await authenticationRemoteDataSource.refreshToken(refreshToken: authenticationLocalDataSource.accessToken);

    if(response.message.isEmpty && response.accessToken.isNotEmpty){
      await authenticationLocalDataSource.setAccessToken(response.accessToken);
      await authenticationLocalDataSource.setRefreshToken(response.refreshToken);
    }
    
    return response;
  }


}
