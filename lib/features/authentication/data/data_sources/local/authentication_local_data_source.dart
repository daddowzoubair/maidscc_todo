import 'package:injectable/injectable.dart';
import 'package:maidscc_todos/core/utils/shared_pref.dart';

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
}