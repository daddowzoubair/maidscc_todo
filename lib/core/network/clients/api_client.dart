import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maidscc_todos/constants/app_api_config.dart';
import 'package:maidscc_todos/features/authentication/data/entities/login/login_model.dart';
import 'package:maidscc_todos/features/authentication/data/entities/user_info/user_info_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient{

  @factoryMethod
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(AppApiConfig.loginApi)
  Future<LoginModel> login(@Body() Map<String, dynamic> queries);

  @GET(AppApiConfig.userInfoApi)
  Future<UserInfoModel> userInfo();

  @POST(AppApiConfig.refreshTokenApi)
  Future<LoginModel> refreshToken(@Body() Map<String, dynamic> queries);

}
