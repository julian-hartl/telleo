import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/blocs/auth/auth_bloc.dart';
import '../../domain/core/services/logger.dart';
import '../../utils/dependencies.dart';
import '../routing/router.dart';
import '../utils/show_snackbar.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          unauthenticated: (_) {
            app.get<ILogger>().logInfo('Unauthenticated');

            context.router.replace(const WelcomePageRoute());
          },
          authenticated: (_) {
            app.get<ILogger>().logInfo('Authenticated');
            context.router.replace(const HomePageRoute());
          },
          error: (err) {
            showErrorSnackbar(context, message: err.message);
          },
          loading: (value) {},
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
