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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:mindpeers/features/home/ui/pages/home.dart' as _i1;
import 'package:mindpeers/features/page_not_found/ui/pages/page_not_found.dart'
    as _i2;

class RootRouter extends _i3.RootStackRouter {
  RootRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeScreen(
          key: args.key,
          dummyValue: args.dummyValue,
        ),
      );
    },
    PageNotFoundScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PageNotFoundScreenRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.PageNotFoundScreen(
          args.routeName,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeScreenRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          PageNotFoundScreenRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i4.Key? key,
    String? dummyValue,
  }) : super(
          HomeScreenRoute.name,
          path: '/',
          args: HomeScreenRouteArgs(
            key: key,
            dummyValue: dummyValue,
          ),
        );

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    this.dummyValue,
  });

  final _i4.Key? key;

  final String? dummyValue;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, dummyValue: $dummyValue}';
  }
}

/// generated route for
/// [_i2.PageNotFoundScreen]
class PageNotFoundScreenRoute
    extends _i3.PageRouteInfo<PageNotFoundScreenRouteArgs> {
  PageNotFoundScreenRoute({
    required String routeName,
    _i4.Key? key,
  }) : super(
          PageNotFoundScreenRoute.name,
          path: '*',
          args: PageNotFoundScreenRouteArgs(
            routeName: routeName,
            key: key,
          ),
        );

  static const String name = 'PageNotFoundScreenRoute';
}

class PageNotFoundScreenRouteArgs {
  const PageNotFoundScreenRouteArgs({
    required this.routeName,
    this.key,
  });

  final String routeName;

  final _i4.Key? key;

  @override
  String toString() {
    return 'PageNotFoundScreenRouteArgs{routeName: $routeName, key: $key}';
  }
}
