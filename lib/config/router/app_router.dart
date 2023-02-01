import 'package:auto_route/auto_route.dart';

import '../../pages/login_page/login_page.dart';
import '../../pages/map_page/map_page.dart';
import '../../utils/splash_screen.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: MapPage,
      path: '/map',
    ),
    AutoRoute(
      page: LoginPage,
      path: '/login',
    ),
  ],
)
class $AppRouter {}
