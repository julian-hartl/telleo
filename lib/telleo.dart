import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/auth/auth_bloc.dart';
import 'package:telleo/presentation/pages/splash_page.dart';
import 'package:telleo/presentation/routing/router.dart';

import 'presentation/constants/colors.dart';
import 'presentation/pages/auth/welcome_page.dart';
import 'utils/dependencies.dart';

Future<void> configureApp() async {
  configureDependenices();
}

class Telleo extends StatelessWidget {
  Telleo({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => app.get<AuthBloc>()
            ..add(
              const RequestUserCheck(),
            ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData.from(
          colorScheme: const ColorScheme.dark(
            background: backgroundColor,
            onBackground: onBackground,
            surface: darkerBackgroundColor,
            primary: accentColor,
            secondary: secondaryAccentColor,
            onPrimary: onAccent,
            onSecondary: onAccent,
            primaryVariant: darkerAccentColor,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 15.0,
              color: onBackground,
            ),
            button: TextStyle(
              fontSize: 16.0,
              color: onAccent,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              color: onBackground,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              color: onBackground,
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
            subtitle2: TextStyle(
              fontSize: 15.0,
              color: dimmedColor,
            ),
          ),
        ).copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: backgroundColor, elevation: 0.0),
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(appRouter),
      ),
    );
  }
}
