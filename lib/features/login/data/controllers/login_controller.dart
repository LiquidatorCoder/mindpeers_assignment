import 'package:data_channel/data_channel.dart';
import 'package:mindpeers/features/login/data/models/authentication_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_response_model.dart';
import 'package:mindpeers/features/login/data/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginController {
  final LoginRepository _loginRepository;

  LoginController(this._loginRepository);

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    final postLoginData = await _loginRepository.postLogin(params);

    if (postLoginData.hasError) {
      return DC.error(
        postLoginData.error!,
      );
    }

    final localCacheData = await _loginRepository.setDeviceAuthenticationCache(
      AuthenticationModel(tokenId: postLoginData.data?.tokenId),
    );

    if (localCacheData.hasError) {
      return DC.error(
        localCacheData.error!,
      );
    }

    return DC.data(
      postLoginData.data,
    );
  }

  // todo init -> fetch token from url -> validate -> refresh
  Future<DC<Exception, AuthenticationModel?>> getAuthenticationData() async {
    return _loginRepository.getAuthenticationData();
  }

  Future<DC<Exception, AuthenticationModel?>>
      getDeviceAuthenticationData() async {
    return _loginRepository.getDeviceAuthenticationData();
  }

  Future<DC<Exception, bool>> logout() async {
    return _loginRepository.deleteDeviceAuthenticationCache();
  }
}
