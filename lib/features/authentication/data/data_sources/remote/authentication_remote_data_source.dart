import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maidscc_todos/constants/app_strings.dart';
import 'package:maidscc_todos/features/authentication/data/entities/login/login_model.dart';

import '../../../../../constants/app_api_config.dart';
import '../../../../../core/network/clients/api_client.dart';
import '../../entities/user_info/user_info_model.dart';

@lazySingleton
class AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(this.apiClient);

  final ApiClient apiClient;

  Future<LoginModel> login({required String userName , required String password}) async {
    try {
      Map<String, dynamic> queries = <String, dynamic>{
        AppApiConfig.userNameLoginApiParameter : userName,
        AppApiConfig.passwordLoginApiParameter : password
      };
      
      return apiClient.login(queries);
      
    
    } on DioException catch (exception) {
      return LoginModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const LoginModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<UserInfoModel> userInfo() async {
    try {
 
      return apiClient.userInfo();
      
    } on DioException catch (exception) {
      return UserInfoModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const UserInfoModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

  Future<LoginModel> refreshToken({required String refreshToken }) async {
    try {
      Map<String, dynamic> queries = <String, dynamic>{
        AppApiConfig.refreshTokenRefreshTokenParameter : refreshToken,
      };
      
      return apiClient.refreshToken(queries);
      
    
    } on DioException catch (exception) {
      return LoginModel.fromJson(json.decode(exception.response.toString()));
    } catch (e) {
      return const LoginModel(
        message: AppStrings.generalErrorMessage,
      );
    }
  }

}