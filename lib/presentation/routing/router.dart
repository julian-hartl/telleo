import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/auth/auth_page/auth_page.dart';
import '../pages/auth/welcome_page.dart';
import '../pages/splash_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
        page: WelcomePage, transitionsBuilder: TransitionsBuilders.fadeIn),
    AutoRoute(page: SplashPage, initial: true),
    CustomRoute(
        page: AuthPage, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: HomePage, transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
  preferRelativeImports: true,
)
class AppRouter extends _$AppRouter {}
