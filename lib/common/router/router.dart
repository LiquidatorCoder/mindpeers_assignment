import 'package:auto_route/auto_route.dart';
import 'package:mindpeers/common/router/router_auth_guard.dart';
import 'package:mindpeers/features/home/ui/pages/home.dart';
import 'package:mindpeers/features/login/ui/pages/login.dart';
import 'package:mindpeers/features/page_not_found/ui/pages/page_not_found.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      guards: [
        RouterAuthGuard,
      ],
      page: HomeScreen,
    ),
    AutoRoute(
      page: LoginScreen,
    ),
    AutoRoute(
      path: '*',
      page: PageNotFoundScreen,
    ),
  ],
)
class $RootRouter {}
