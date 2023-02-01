import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'config/di/locator.dart';
import 'config/router/app_router.gr.dart';
import 'config/router/mapper_observer.dart';
import 'config/router/mapper_router.dart';
import 'cubit/app_control/app_control_cubit.dart';

class MapperApp extends StatelessWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator<AppControlCubit>(),
      child: const MapperApp._(),
    );
  }

  const MapperApp({super.key});

  const MapperApp._();

  void _onStateChanged(BuildContext _, AppControlState state) {
    switch (state.status) {
      case AppControlStatus.initial:
      case AppControlStatus.unauthenticated:
        router.resetToLoginPage();
        break;
      case AppControlStatus.authenticated:
        router.resetToMapPage();
        break;
      case AppControlStatus.error:
        router.popUntilRoot();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocConsumer<AppControlCubit, AppControlState>(
          listener: _onStateChanged,
          builder: (context, state) {
            return MaterialApp.router(
              routerDelegate: AutoRouterDelegate(
                appRouter,
                navigatorObservers: () => [
                  MapperObserver(),
                  AutoRouteObserver(),
                ],
              ),
              routeInformationParser: appRouter.defaultRouteParser(),
              routeInformationProvider: appRouter.routeInfoProvider(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
