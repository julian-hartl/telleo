// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WelcomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const WelcomePage(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SplashPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    AuthPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const AuthPage(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    ChatsPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const ChatsPage(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        RouteConfig(SplashPageRoute.name, path: '/'),
        RouteConfig(AuthPageRoute.name, path: '/auth-page'),
        RouteConfig(ChatsPageRoute.name, path: '/chats-page')
      ];
}

/// generated route for [WelcomePage]
class WelcomePageRoute extends PageRouteInfo<void> {
  const WelcomePageRoute() : super(name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

/// generated route for [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for [AuthPage]
class AuthPageRoute extends PageRouteInfo<void> {
  const AuthPageRoute() : super(name, path: '/auth-page');

  static const String name = 'AuthPageRoute';
}

/// generated route for [ChatsPage]
class ChatsPageRoute extends PageRouteInfo<void> {
  const ChatsPageRoute() : super(name, path: '/chats-page');

  static const String name = 'ChatsPageRoute';
}
