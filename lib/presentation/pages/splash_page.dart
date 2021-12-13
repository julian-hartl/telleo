import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/presentation/widgets/telleo_widgets/telleo_text_button.dart';

import '../../application/blocs/auth/auth_bloc.dart';
import '../../domain/core/services/logger.dart';
import '../../utils/dependencies.dart';
import '../routing/router.dart';
import '../utils/show_snackbar.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
            unauthenticated: (_) {
              context.router.replace(const WelcomePageRoute());
            },
            authenticated: (_) {
              context.router.replace(const HomePageRoute());
            },
            error: (err) {
              showErrorSnackbar(context, message: err.message);
            },
            loading: (value) {},
          );
        },
        builder: (context, state) => Scaffold(
              body: state.maybeWhen(
                orElse: () => Container(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(message),
                    TelleoTextButton(
                      text: 'Retry',
                      onPressed: () => context.read<AuthBloc>().add(
                            const AuthEvent.signIn(),
                          ),
                    )
                  ],
                ),
              ),
            ));
  }
}
