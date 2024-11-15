
import 'package:dio/dio.dart';


import '../../../constants/app_api_config.dart';
import '../../../features/authentication/data/repositories/authentication_repository.dart';
import '../../service_locator/service_locator.dart';
import '../../utils/shared_pref.dart';

class DioClient {
  final Dio _dio;

  // Private constructor for DioClient to initialize Dio with interceptors
  DioClient._internal(this._dio) {
    // Adding interceptors to Dio for request/response handling
    _dio.interceptors.add(InterceptorsWrapper(
      // Interceptor to add Authorization header with token for each request
      onRequest: (options, handler) async {
        final token = getIt<SharedPreferencesStorage>().accessToken; // Get access token
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token'; // Add token to headers if available
        }
        return handler.next(options);
      },
      
      // Interceptor to handle 401 (Unauthorized) responses and refresh token
      onResponse: (response, handler) async {
        if (response.statusCode == 401 && getIt<SharedPreferencesStorage>().accessToken.isNotEmpty) {
          await getIt<AuthenticationRepository>().refreshToken(); // Refresh token if unauthorized
          return handler.resolve(response); // Resolve the response after refreshing the token
        }
        return handler.next(response);
      },
      
      // Interceptor to handle errors in requests
      onError: (DioException e, handler) {
        return handler.next(e); // Pass the error to the next handler
      },
    ));
  }

  // Exposing the Dio instance for use in network requests
  Dio get dio => _dio;

  // Singleton instance of DioClient
  static final DioClient _instance = DioClient._internal(Dio(BaseOptions(
    baseUrl: AppApiConfig.baseUrl // Set base URL for the API
  )));

  // Factory constructor to return the singleton instance
  factory DioClient() => _instance;
}