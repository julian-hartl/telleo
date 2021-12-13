import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:telleo/presentation/pages/home/edit_profile_page.dart';

import '../../domain/chats/chat_entity.dart';
import '../pages/auth/auth_page/auth_page.dart';
import '../pages/auth/welcome_page.dart';
import '../pages/home/chat_page.dart';
import '../pages/home/home_page.dart';
import '../pages/splash_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: WelcomePage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    AutoRoute(page: SplashPage, initial: true),
    CustomRoute(
      page: AuthPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: HomePage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ChatPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: EditProfilePage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
  ],
  preferRelativeImports: true,
)
class AppRouter extends _$AppRouter {}
