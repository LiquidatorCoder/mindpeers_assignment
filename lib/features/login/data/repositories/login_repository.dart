import 'package:data_channel/data_channel.dart';
import 'package:mindpeers/common/network/network_info.dart';
import 'package:mindpeers/features/login/data/data_sources/login_local_data_source.dart';
import 'package:mindpeers/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:mindpeers/features/login/data/models/authentication_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_response_model.dart';
import 'package:mindpeers/features/login/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginRepository {
  final LoginLocalDataSource _loginLocalDataSource;
  final LoginRemoteDataSource _loginRemoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepository(
    this._loginLocalDataSource,
    this._loginRemoteDataSource,
    this._networkInfo,
  );

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    return _loginRemoteDataSource.postLogin(params);
  }

  Future<DC<Exception, AuthenticationModel?>> getAuthenticationData() async {
    if (await _networkInfo.isConnected) {
      final getLocalTokenData = await getDeviceAuthenticationData();

      if (getLocalTokenData.hasError) {
        return DC.error(getLocalTokenData.error!);
      }

      final loginData = await getUserData();

      return DC.forward(
        loginData,
        AuthenticationModel(tokenId: getLocalTokenData.data!.tokenId),
      );
    }

    return getDeviceAuthenticationData();
  }

  Future<DC<Exception, UserModel>> getUserData() async {
    return _loginRemoteDataSource.getLogin();
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
