import 'package:injectable/injectable.dart';
import 'package:maidscc_todos/core/network/clients/api_client.dart';
import 'package:maidscc_todos/core/network/clients/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';




@module
abstract class RegisterServicesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  DioClient get dioClient => DioClient();

  @lazySingleton
  ApiClient get apiClient => ApiClient(dioClient.dio);


}