// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/register/register_view.dart' as _i3;
import '../ui/views/startup/startup_viewmodel.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    StartupView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.StartupView());
    },
    HomeView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    RegisterView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterView());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(StartupView.name, path: '/'),
        _i4.RouteConfig(HomeView.name, path: '/home-view'),
        _i4.RouteConfig(RegisterView.name, path: '/register-view')
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupView extends _i4.PageRouteInfo<void> {
  const StartupView() : super(StartupView.name, path: '/');

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeView extends _i4.PageRouteInfo<void> {
  const HomeView() : super(HomeView.name, path: '/home-view');

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.RegisterView]
class RegisterView extends _i4.PageRouteInfo<void> {
  const RegisterView() : super(RegisterView.name, path: '/register-view');

  static const String name = 'RegisterView';
}
