
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/entities/user_info/user_info_model.dart';

@LazySingleton(order: 1)
class SharedPreferencesStorage {
  final SharedPreferences _sharedPreferences;
  SharedPreferencesStorage(this._sharedPreferences);

  final String _accessToken = "ACCESS_TOKEN";
  final String _refreshToken = "REFRESH_TOKEN";
  final String _userInfo = "USER_INFO";

 
  String get accessToken => _sharedPreferences.getString(_accessToken) ?? '';

  Future<bool> setAccessToken(String accessToken) async {
    return _sharedPreferences.setString(_accessToken, accessToken);
  }


  String get refreshToken => _sharedPreferences.getString(_refreshToken) ?? '';

  Future<bool> setRefreshToken(String refreshToken) async {
    return _sharedPreferences.setString(_refreshToken, refreshToken);
  }

  UserInfoModel get userInfo => UserInfoModel.fromJson(jsonDecode(_sharedPreferences.getString(_userInfo) ?? "{}"));

  Future<bool> setUserInfo(UserInfoModel userInfo) async {
    return _sharedPreferences.setString(_userInfo, jsonEncode(userInfo.toJson()));
  }

}
