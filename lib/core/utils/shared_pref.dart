
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(order: 1)
class SharedPreferencesStorage {
  final SharedPreferences _sharedPreferences;
  SharedPreferencesStorage(this._sharedPreferences);

  final String _accessToken = "ACCESS_TOKEN";
  final String _refreshToken = "REFRESH_TOKEN";

 
  String get accessToken => _sharedPreferences.getString(_accessToken) ?? '';

  Future<bool> setAccessToken(String accessToken) async {
    return _sharedPreferences.setString(_accessToken, accessToken);
  }


  String get refreshToken => _sharedPreferences.getString(_refreshToken) ?? '';

  Future<bool> setRefreshToken(String refreshToken) async {
    return _sharedPreferences.setString(_refreshToken, refreshToken);
  }

}
