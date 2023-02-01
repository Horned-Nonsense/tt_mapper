import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../di/locator.dart';
import 'app_router.gr.dart';
import 'base_router.dart';

final router = locator<NotaroRouter>();

@singleton
class NotaroRouter extends BaseRouter {
  NotaroRouter(AppRouter router) : super(router);

  @override
  TabsRouter? getMainPageTabsRouter(BuildContext context) {
    return context.innerRouterOf<TabsRouter>(MapRoute.name);
  }

  Future<void> resetToMapPage() async {
    pushAndClearStack(const MapRoute());
  }

  Future<void> resetToLoginPage() async {
    pushAndClearStack(const LoginRoute());
  }
}
