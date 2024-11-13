import 'package:maidscc_todos/features/authentication/data/entities/login/login_model.dart';
import 'package:maidscc_todos/features/authentication/data/entities/user_info/user_info_model.dart';

abstract class AuthenticationRepository {
  Future<LoginModel> login({required String userName , required String password});
  Future<UserInfoModel> userInfo();
  Future<LoginModel> refreshToken();
}