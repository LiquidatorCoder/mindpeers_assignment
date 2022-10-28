import 'package:mindpeers/common/router/router.gr.dart';
import 'package:mindpeers/common/router/router_auth_guard.dart';

final rootRouter = RootRouter(
  routerAuthGuard: RouterAuthGuard(),
);
