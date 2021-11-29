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
    HomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
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
        RouteConfig(HomePageRoute.name, path: '/home-page')
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

/// generated route for [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(name, path: '/home-page');

  static const String name = 'HomePageRoute';
}
