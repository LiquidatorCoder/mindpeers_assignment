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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:mindpeers/common/router/router_auth_guard.dart' as _i6;
import 'package:mindpeers/features/home/ui/pages/home.dart' as _i1;
import 'package:mindpeers/features/login/ui/pages/login.dart' as _i2;
import 'package:mindpeers/features/page_not_found/ui/pages/page_not_found.dart'
    as _i3;

class RootRouter extends _i4.RootStackRouter {
  RootRouter({
    _i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
    required this.routerAuthGuard,
  }) : super(navigatorKey);

  final _i6.RouterAuthGuard routerAuthGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeScreen(
          key: args.key,
          dummyValue: args.dummyValue,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginScreen(
          key: args.key,
          redirectOnLogin: args.redirectOnLogin,
        ),
      );
    },
    PageNotFoundRoute.name: (routeData) {
      final args = routeData.argsAs<PageNotFoundRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.PageNotFoundScreen(
          args.routeName,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [routerAuthGuard],
        ),
        _i4.RouteConfig(
          LoginRoute.name,
          path: '/login-screen',
        ),
        _i4.RouteConfig(
          PageNotFoundRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i5.Key? key,
    String? dummyValue,
  }) : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(
            key: key,
            dummyValue: dummyValue,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.dummyValue,
  });

  final _i5.Key? key;

  final String? dummyValue;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, dummyValue: $dummyValue}';
  }
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i5.Key? key,
    required _i4.PageRouteInfo<dynamic>? redirectOnLogin,
  }) : super(
          LoginRoute.name,
          path: '/login-screen',
          args: LoginRouteArgs(
            key: key,
            redirectOnLogin: redirectOnLogin,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.redirectOnLogin,
  });

  final _i5.Key? key;

  final _i4.PageRouteInfo<dynamic>? redirectOnLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, redirectOnLogin: $redirectOnLogin}';
  }
}

/// generated route for
/// [_i3.PageNotFoundScreen]
class PageNotFoundRoute extends _i4.PageRouteInfo<PageNotFoundRouteArgs> {
  PageNotFoundRoute({
    required String routeName,
    _i5.Key? key,
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'PageNotFoundRouteArgs{routeName: $routeName, key: $key}';
  }
}
