
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/entities/user_info/user_info_model.dart';

@LazySingleton(order: 1)
class SharedPreferencesStorage {
  final SharedPreferences _sharedPreferences;

  // Constructor to initialize SharedPreferencesStorage with SharedPreferences instance
  SharedPreferencesStorage(this._sharedPreferences);

  // Keys for accessing the tokens and user information in SharedPreferences
  final String _accessToken = "ACCESS_TOKEN";
  final String _refreshToken = "REFRESH_TOKEN";
  final String _userInfo = "USER_INFO";

  // Getter for access token, returns an empty string if not set
  String get accessToken => _sharedPreferences.getString(_accessToken) ?? '';

  // Setter for access token in SharedPreferences
  Future<bool> setAccessToken(String accessToken) async {
    return _sharedPreferences.setString(_accessToken, accessToken); // Store the token
  }

  // Getter for refresh token, returns an empty string if not set
  String get refreshToken => _sharedPreferences.getString(_refreshToken) ?? '';

  // Setter for refresh token in SharedPreferences
  Future<bool> setRefreshToken(String refreshToken) async {
    return _sharedPreferences.setString(_refreshToken, refreshToken); // Store the refresh token
  }

  // Getter for user information, deserializes JSON string into UserInfoModel
  UserInfoModel get userInfo => UserInfoModel.fromJson(jsonDecode(_sharedPreferences.getString(_userInfo) ?? "{}"));

  // Setter for user information, serializes UserInfoModel into JSON and stores it
  Future<bool> setUserInfo(UserInfoModel userInfo) async {
    return _sharedPreferences.setString(_userInfo, jsonEncode(userInfo.toJson())); // Store the user info
  }
}
