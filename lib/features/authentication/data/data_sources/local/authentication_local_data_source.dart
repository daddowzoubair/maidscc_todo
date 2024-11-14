import 'package:injectable/injectable.dart';
import '../../../../../core/utils/shared_pref.dart';
import '../../entities/user_info/user_info_model.dart';

@lazySingleton
class AuthenticationLocalDataSource{
  AuthenticationLocalDataSource(this.localClient);

  final SharedPreferencesStorage localClient;

  String get accessToken => localClient.accessToken;

  Future<bool> setAccessToken(String accessToken) async {
    return localClient.setAccessToken(accessToken);
  }


  String get refreshToken => localClient.refreshToken;

  Future<bool> setRefreshToken(String refreshToken) async {
    return localClient.setRefreshToken(refreshToken);
  }


  UserInfoModel get userInfo => localClient.userInfo;

  Future<bool> setUserInfo(UserInfoModel userInfo) async {
    return localClient.setUserInfo(userInfo);
  }
}