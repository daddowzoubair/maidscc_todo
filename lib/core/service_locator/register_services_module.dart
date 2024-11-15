import 'package:injectable/injectable.dart';
import '../network/clients/api_client.dart';
import '../network/clients/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';




@module
abstract class RegisterServicesModule {

  // register SharedPreferences instance
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // register dio client as singleton class
  @lazySingleton
  DioClient get dioClient => DioClient();

  // register api client as singleton class
  @lazySingleton
  ApiClient get apiClient => ApiClient(dioClient.dio);


}