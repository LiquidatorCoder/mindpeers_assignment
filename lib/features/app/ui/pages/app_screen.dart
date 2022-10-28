import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mindpeers/common/router/root_router.dart';
import 'package:mindpeers/constants/env.dart';
import 'package:mindpeers/constants/strings.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return const Scaffold(
        body: Center(
          child: Text('Oops.. Some error occured.'),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: env.config.debugShowCheckedModeBanner,
      debugShowMaterialGrid: env.config.debugShowMaterialGrid,
      builder: (context, nativeNavigator) {
        setErrorBuilder();

        return nativeNavigator!;
      },
      title: Strings.appName,
      routeInformationParser: rootRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        rootRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
    );
  }
}
