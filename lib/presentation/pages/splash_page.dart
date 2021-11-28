import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/presentation/utils/show_snackbar.dart';
import '../../application/blocs/auth/auth_bloc.dart';
import '../routing/router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          unauthenticated: (_) {
            context.router.push(const WelcomePageRoute());
          },
          authenticated: (_) {
            context.router.push(const ChatsPageRoute());
          },
          error: (AuthError err) {
            showErrorSnackbar(context, message: err.message);
          },
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
