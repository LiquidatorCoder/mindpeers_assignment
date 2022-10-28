import 'package:dio/dio.dart';
import 'package:mindpeers/common/api_client/api_errors/bad_network_api_error.dart';
import 'package:mindpeers/common/di/di.dart';
import 'package:mindpeers/common/network/network_info.dart';

class BadNetworkErrorInterceptor extends Interceptor {
  final NetworkInfo _networkInfo = getIt<NetworkInfo>();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return options;
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response == null && !await _networkInfo.isConnected) {
      return BadNetworkApiError(dioError: err);
    }

    return null;
  }
}
