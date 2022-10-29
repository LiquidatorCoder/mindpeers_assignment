import 'package:data_channel/data_channel.dart';
import 'package:mindpeers/common/api_client/api_client.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:mindpeers/features/login/data/models/post_login_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginRemoteDataSource {
  final ApiClient _apiClient;

  LoginRemoteDataSource(this._apiClient);

  Future<DC<Exception, PostLoginResponseModel>> postLogin(
    PostLoginRequestModel params,
  ) async {
    try {
      // Post login data to server

      return DC.data(
        PostLoginResponseModel.fromJson(const {
          'token_id': 'token',
        }),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }
}
