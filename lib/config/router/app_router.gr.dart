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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../models/mapper_user.dart' as _i7;
import '../../pages/login_page/login_page.dart' as _i3;
import '../../pages/map_page/map_page.dart' as _i2;
import '../../pages/user_profile_page/user_profile_page.dart' as _i4;
import '../../utils/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MapRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.MapPage()),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.LoginPage()),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>();
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(
            child: _i4.UserProfilePage(
          key: args.key,
          currentUser: args.currentUser,
        )),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          MapRoute.name,
          path: '/map',
        ),
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          UserProfileRoute.name,
          path: '/profile',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.MapPage]
class MapRoute extends _i5.PageRouteInfo<void> {
  const MapRoute()
      : super(
          MapRoute.name,
          path: '/map',
        );

  static const String name = 'MapRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.UserProfilePage]
class UserProfileRoute extends _i5.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i6.Key? key,
    required _i7.MapperUser currentUser,
  }) : super(
          UserProfileRoute.name,
          path: '/profile',
          args: UserProfileRouteArgs(
            key: key,
            currentUser: currentUser,
          ),
        );

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    this.key,
    required this.currentUser,
  });

  final _i6.Key? key;

  final _i7.MapperUser currentUser;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, currentUser: $currentUser}';
  }
}
