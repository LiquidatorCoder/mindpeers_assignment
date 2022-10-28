import 'package:dio/dio.dart';
import 'package:mindpeers/common/di/di.dart';
import 'package:mindpeers/features/login/data/controllers/login_controller.dart';

class AuthInterceptor extends Interceptor {
  LoginController get loginController => getIt<LoginController>();

  @override
  Future<RequestOptions> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authData = await loginController.getDeviceAuthenticationData();

    if (!authData.hasError &&
        authData.hasData &&
        authData.data!.isAuthenticated) {
      options.headers['Authorization'] = 'Bearer ${authData.data!.tokenId}';
    }

    return options;
  }
}
