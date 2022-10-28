import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:mindpeers/common/router/root_router.dart';
import 'package:mindpeers/common/router/router.gr.dart';

bool? isCurrentScreen(BuildContext? context) {
  if (context == null) {
    return null;
  }

  return ModalRoute.of(context)!.isCurrent;
}

String? getCurrentScreen(BuildContext? context) {
  if (context == null) {
    return null;
  }

  return ModalRoute.of(context)!.settings.name;
}

Future<T?> navigateToRoute<T>({
  BuildContext? context,
  required PageRouteInfo route,
  bool? skipSameRouteCheck,
}) async {
  final skipRouteCheck = skipSameRouteCheck ?? true;

  if (!skipRouteCheck && getCurrentScreen(context) == route.routeName) {
    return null;
  }

  if (route.routeName == HomeScreenRoute.name) {
    var routeArgs = const HomeScreenRouteArgs();

    if (route.args is HomeScreenRouteArgs) {
      routeArgs = route.args as HomeScreenRouteArgs;
    }

    return navigateToHomeScreen<T>(routeArgs: routeArgs);
  }

  return rootRouter.push(route);
}

Future<T?> navigateToRouteAndReplace<T>(
  PageRouteInfo route,
) async {
  if (route.routeName == HomeScreenRoute.name) {
    var routeArgs = const HomeScreenRouteArgs();

    if (route.args is HomeScreenRouteArgs) {
      routeArgs = route.args as HomeScreenRouteArgs;
    }

    return navigateToHomeScreen<T>(routeArgs: routeArgs);
  }

  return rootRouter.replace(
    route,
  );
}

Future<T?> navigateToRouteAndRemoveUntil<T>(
  PageRouteInfo route,
) async {
  return rootRouter.pushAndPopUntil<T>(
    route,
    predicate: (r) => false,
  );
}

Future<bool> popCurrentRoute<T>({T? result}) async {
  return rootRouter.pop<T>(result);
}

bool canPopCurrentRoute<T>() {
  return rootRouter.canPop();
}

/// navigating to homescreen should clear the navigation stack and start again
Future<T?> navigateToHomeScreen<T>({
  HomeScreenRouteArgs? routeArgs,
}) async {
  return navigateToRouteAndRemoveUntil<T>(
    HomeScreenRoute(
      dummyValue: routeArgs?.dummyValue,
    ),
  );
}
