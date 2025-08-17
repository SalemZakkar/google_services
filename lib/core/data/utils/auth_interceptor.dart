
import 'package:dio/dio.dart';
import 'package:google_services/constance.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(GoogleServicesConstance.headers);
    super.onRequest(options, handler);
  }



}
