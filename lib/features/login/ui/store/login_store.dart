import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:mindpeers/common/enums/state_status.dart';
import 'package:mindpeers/common/exceptions/exceptions.dart';
import 'package:mindpeers/common/helpers/navigation_helper.dart';
import 'package:mindpeers/features/login/data/controllers/login_controller.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

@LazySingleton()
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  LoginController loginController;

  _LoginStoreBase(
    this.loginController,
  );

  @observable
  StateStatus isLoggedInStatus = StateStatus.initial;
  @observable
  bool? isLoggedIn;

  @observable
  String? errorMessage;

  @action
  Future<void> doLogin(
    BuildContext context,
    PostLoginRequestModel params, {
    PageRouteInfo? redirectOnLogin,
  }) async {
    isLoggedInStatus = StateStatus.loading;
    final loginData = await loginController.postLogin(params);
    isLoggedInStatus = StateStatus.success;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          return;
        }
      },
      onData: (data) {
        if (data.tokenId == null) {
          isLoggedIn = false;

          return;
        }

        if (redirectOnLogin != null) {
          navigateToRouteAndReplace(redirectOnLogin);
        } else {
          popCurrentRoute();
        }

        isLoggedIn = true;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> getAuthentication(BuildContext context) async {
    isLoggedInStatus = StateStatus.loading;
    final loginData = await loginController.getAuthenticationData();
    isLoggedInStatus = StateStatus.success;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          logout(context, redirectToHome: false);
        }
      },
      onData: (data) {
        if (data!.isAuthenticated) {
          canPopCurrentRoute();

          isLoggedIn = true;

          return;
        }

        isLoggedIn = false;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> logout(BuildContext context, {bool? redirectToHome}) async {
    final _redirectToHome = redirectToHome ?? true;

    final logoutData = await loginController.logout();

    logoutData.pick(
      onError: (error) {
        if (error is! CacheException) {
          isLoggedIn = false;
        }
      },
      onData: (data) {
        if (_redirectToHome) {
          navigateToHomeScreen(routeArgs: null);
        }

        isLoggedIn = false;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }
}
