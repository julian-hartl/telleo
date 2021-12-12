import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/blocs/failures/chat_failure_bloc.dart';

import 'application/blocs/app/chat/actor/chat_actor_bloc.dart';
import 'application/blocs/app/chat/loader/chat_bloc.dart';
import 'application/blocs/app/user/actor/bloc/user_actor_bloc.dart';
import 'application/blocs/app/user/loader/user_bloc.dart';
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
          create: (context) =>
              app.get<AuthBloc>()..add(const AuthEvent.signIn()),
        ),
        BlocProvider(
          create: (context) => app.get<UserBloc>(),
        ),
        BlocProvider(
          create: (context) => app.get<UserActorBloc>(),
        ),
        BlocProvider(
          create: (context) => app.get<ChatBloc>(),
        ),
        BlocProvider(
          create: (context) => app.get<ChatActorBloc>(),
        ),
        BlocProvider(
          create: (context) => app.get<ChatFailureBloc>(),
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
