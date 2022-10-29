import 'package:data_channel/data_channel.dart';
import 'package:mindpeers/features/login/data/data_sources/login_local_data_source.dart';
import 'package:mindpeers/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:mindpeers/features/login/data/models/authentication_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginRepository {
  final LoginLocalDataSource _loginLocalDataSource;
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepository(
    this._loginLocalDataSource,
    this._loginRemoteDataSource,
  );

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    return _loginRemoteDataSource.postLogin(params);
  }

  Future<DC<Exception, AuthenticationModel?>> getAuthenticationData() async {
    return getDeviceAuthenticationData();
  }

  Future<DC<Exception, AuthenticationModel?>>
      getDeviceAuthenticationData() async {
    return _loginLocalDataSource.getAuthenticationData();
  }

  Future<DC<Exception, AuthenticationModel>> setDeviceAuthenticationCache(
    AuthenticationModel authData,
  ) async {
    return _loginLocalDataSource.setAuthenticationCache(authData);
  }

  Future<DC<Exception, bool>> deleteDeviceAuthenticationCache() async {
    return _loginLocalDataSource.deleteAuthenticationCache();
  }
}
