import 'package:auto_route/auto_route.dart';

import '../../pages/login_page/login_page.dart';
import '../../pages/map_page/map_page.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginPage,
      path: '/login',
      initial: true,
    ),
    AutoRoute(
      page: MapPage,
      path: '/map',
    ),
  ],
)
class $AppRouter {}
