import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mindpeers/common/router/router_auth_guard.dart';
import 'package:mindpeers/features/home/ui/pages/home.dart';
import 'package:mindpeers/features/login/ui/pages/onboarding.dart';
import 'package:mindpeers/features/page_not_found/ui/pages/page_not_found.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
      customRouteBuilder: cupertinoModalRouteBuilder,
      initial: true,
      guards: [
        RouterAuthGuard,
      ],
      page: HomeScreen,
    ),
    CustomRoute(
      customRouteBuilder: cupertinoModalRouteBuilder,
      page: OnboardingScreen,
    ),
    CustomRoute(
      customRouteBuilder: cupertinoModalRouteBuilder,
      path: '*',
      page: PageNotFoundScreen,
    ),
  ],
)
class $RootRouter {}

Route<T> cupertinoModalRouteBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return MaterialWithModalsPageRoute(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    builder: (_) => child,
  );
}
