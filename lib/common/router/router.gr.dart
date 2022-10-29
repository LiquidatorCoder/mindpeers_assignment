// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:mindpeers/common/router/router.dart' as _i8;
import 'package:mindpeers/common/router/router_auth_guard.dart' as _i7;
import 'package:mindpeers/features/home/ui/pages/home.dart' as _i1;
import 'package:mindpeers/features/home/ui/pages/test.dart' as _i3;
import 'package:mindpeers/features/login/ui/pages/onboarding.dart' as _i2;
import 'package:mindpeers/features/page_not_found/ui/pages/page_not_found.dart'
    as _i4;

class RootRouter extends _i5.RootStackRouter {
  RootRouter({
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    required this.routerAuthGuard,
  }) : super(navigatorKey);

  final _i7.RouterAuthGuard routerAuthGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
        customRouteBuilder: _i8.cupertinoModalRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>();
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.OnboardingScreen(
          key: args.key,
          redirectOnLogin: args.redirectOnLogin,
        ),
        customRouteBuilder: _i8.cupertinoModalRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TestRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.TestScreen(),
        customRouteBuilder: _i8.cupertinoModalRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PageNotFoundRoute.name: (routeData) {
      final args = routeData.argsAs<PageNotFoundRouteArgs>();
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.PageNotFoundScreen(
          args.routeName,
          key: args.key,
        ),
        customRouteBuilder: _i8.cupertinoModalRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [routerAuthGuard],
        ),
        _i5.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-screen',
        ),
        _i5.RouteConfig(
          TestRoute.name,
          path: '/test-screen',
        ),
        _i5.RouteConfig(
          PageNotFoundRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i6.Key? key,
    required _i5.PageRouteInfo<dynamic>? redirectOnLogin,
  }) : super(
          OnboardingRoute.name,
          path: '/onboarding-screen',
          args: OnboardingRouteArgs(
            key: key,
            redirectOnLogin: redirectOnLogin,
          ),
        );

  static const String name = 'OnboardingRoute';
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({
    this.key,
    required this.redirectOnLogin,
  });

  final _i6.Key? key;

  final _i5.PageRouteInfo<dynamic>? redirectOnLogin;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, redirectOnLogin: $redirectOnLogin}';
  }
}

/// generated route for
/// [_i3.TestScreen]
class TestRoute extends _i5.PageRouteInfo<void> {
  const TestRoute()
      : super(
          TestRoute.name,
          path: '/test-screen',
        );

  static const String name = 'TestRoute';
}

/// generated route for
/// [_i4.PageNotFoundScreen]
class PageNotFoundRoute extends _i5.PageRouteInfo<PageNotFoundRouteArgs> {
  PageNotFoundRoute({
    required String routeName,
    _i6.Key? key,
  }) : super(
          PageNotFoundRoute.name,
          path: '*',
          args: PageNotFoundRouteArgs(
            routeName: routeName,
            key: key,
          ),
        );

  static const String name = 'PageNotFoundRoute';
}

class PageNotFoundRouteArgs {
  const PageNotFoundRouteArgs({
    required this.routeName,
    this.key,
  });

  final String routeName;

  final _i6.Key? key;

  @override
  String toString() {
    return 'PageNotFoundRouteArgs{routeName: $routeName, key: $key}';
  }
}
