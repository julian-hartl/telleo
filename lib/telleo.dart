import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/home/chats/chats_bloc.dart';
import 'application/blocs/auth/auth_bloc.dart';
import 'presentation/constants/themes.dart';
import 'presentation/routing/router.dart';

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
        theme: darkTheme,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(appRouter),
      ),
    );
  }
}
