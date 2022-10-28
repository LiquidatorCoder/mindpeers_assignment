import 'package:auto_route/auto_route.dart';
import 'package:mindpeers/features/home/ui/pages/home.dart';
import 'package:mindpeers/features/page_not_found/ui/pages/page_not_found.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: HomeScreen,
    ),
    AutoRoute(
      path: '*',
      page: PageNotFoundScreen,
    ),
  ],
)
class $RootRouter {}
