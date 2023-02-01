import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class BaseRouter {
  final StackRouter stackRouter;

  const BaseRouter(this.stackRouter);

  TabsRouter? getMainPageTabsRouter(BuildContext context);

  Future<void> pop<T extends Object?>([T? result]) => stackRouter.pop<T>();

  @protected
  Future<T?> push<T extends Object?>(PageRouteInfo<dynamic> route) =>
      stackRouter.push<T>(route);

  @protected
  Future<void> replace(PageRouteInfo<dynamic> route) =>
      stackRouter.replace(route);

  void popUntilRoot() => stackRouter.popUntilRoot();

  @protected
  void popUntilPath(PageRouteInfo<dynamic> route) {
    return stackRouter.popUntilRouteWithName(route.routeName);
  }

  @protected
  Future<void> pushAndClearStack(PageRouteInfo<dynamic> route) {
    return stackRouter.pushAndPopUntil(route, predicate: (_) => false);
  }

  T? getObserver<T extends AutoRouteObserver>(BuildContext context) {
    return RouterScope.of(context).firstObserverOfType<T>();
  }
}
