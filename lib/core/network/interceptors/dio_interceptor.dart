
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class DioInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}

}



