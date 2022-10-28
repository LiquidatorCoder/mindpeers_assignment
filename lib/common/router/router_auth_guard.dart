import 'package:auto_route/auto_route.dart';
import 'package:mindpeers/common/di/di.dart';
import 'package:mindpeers/common/exceptions/exceptions.dart';
import 'package:mindpeers/common/router/router.gr.dart';
import 'package:mindpeers/features/login/data/controllers/login_controller.dart';

class RouterAuthGuard extends AutoRouteGuard {
  final LoginController _loginController = getIt<LoginController>();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final deviceAuthenticationData =
        await _loginController.getDeviceAuthenticationData();

    if (deviceAuthenticationData.error is UnauthenticatedException) {
      await router.push(
        LoginRoute(
          redirectOnLogin: resolver.route.toPageRouteInfo(),
        ),
      );
      return resolver.next(false);
    }

    if (deviceAuthenticationData.data?.isAuthenticated ?? false) {
      return resolver.next(true);
    }

    return resolver.next(true);
  }
}
