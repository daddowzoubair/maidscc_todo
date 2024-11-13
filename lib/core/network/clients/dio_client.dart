
import 'package:dio/dio.dart';


import '../../../constants/app_api_config.dart';
import '../../../features/authentication/data/repositories/authentication_repository.dart';
import '../../service_locator/service_locator.dart';
import '../../utils/shared_pref.dart';

class DioClient {
  final Dio _dio;

  DioClient._internal(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = getIt<SharedPreferencesStorage>().accessToken;
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        if(response.statusCode == 401 && getIt<SharedPreferencesStorage>().accessToken.isNotEmpty){
          await getIt<AuthenticationRepository>().refreshToken();
          return handler.resolve(response);
        }
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;

  static final DioClient _instance = DioClient._internal(Dio(BaseOptions(
    baseUrl: AppApiConfig.baseUrl
  )));

  factory DioClient() => _instance;
}