import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/blocs/auth/auth_form/auth_form_bloc.dart';

import '../../../../domain/core/services/logger.dart';
import '../../../../utils/dependencies.dart';

import '../../../constants/colors.dart';
import '../../../constants/decorations.dart';
import '../../../constants/padding.dart';
import '../../../widgets/isolated/theme_builder.dart';
import '../../../widgets/telleo_widgets/telleo_text_button.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(builder: (context, theme) {
      return SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: BlocConsumer<AuthFormBloc, AuthFormState>(
            listener: (context, state) {
              state.authFailureOrSuccess.fold(
                () {},
                (either) {
                  /*
                  either.fold(
                    (failure) => app.get<ILogger>().logInfo(
                          failure.map(
                            serverError: (_) => 'Server error',
                            cancelledByUser: (_) => 'Cancelled',
                            invalidEmailPasswordCombination: (_) =>
                                'Invalid email password combination',
                            emailAlreadyInUse: (_) => 'Email already in use',
                          ),
                        ),
                    (r) => null)
                  */
                },
              );
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Let\'s sign you in.',
                          style: theme.textTheme.headline1!),
                      const Gap(10),
                      Text(
                        'Welcome back.',
                        style: theme.textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Gap(7),
                      Text(
                        'You\'ve been missed!',
                        style: theme.textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Gap(80),
                      Form(
                        autovalidateMode: state.showErrorMessages
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              validator: (value) => context
                                  .read<AuthFormBloc>()
                                  .state
                                  .emailAdress
                                  .value
                                  .fold(
                                    (l) => 'Invalid Email',
                                    (r) => null,
                                  ),
                              onChanged: (value) => context
                                  .read<AuthFormBloc>()
                                  .add(AuthFormEvent.emailChanged(value)),
                              decoration:
                                  outlineInputDecoration(theme, hint: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                            ),
                            const Gap(20),
                            TextFormField(
                              validator: (value) => context
                                  .read<AuthFormBloc>()
                                  .state
                                  .password
                                  .value
                                  .fold(
                                    (l) => l.maybeMap(
                                      shortPassword: (_) => 'Short Password',
                                      orElse: () => 'Unknown Error',
                                    ),
                                    (r) => null,
                                  ),
                              onChanged: (value) => context
                                  .read<AuthFormBloc>()
                                  .add(AuthFormEvent.passwordChanged(value)),
                              decoration: outlineInputDecoration(theme,
                                  hint: 'Password'),
                              obscureText: true,
                            ),
                            const Gap(5),
                            Text(
                              'Forgot password?',
                              style: theme.textTheme.subtitle2,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Gap(25),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          context
                              .read<AuthFormBloc>()
                              .add(const AuthFormEvent.signInWithGoogle());
                        },
                      ),
                      const Gap(10),
                      Text(
                        'or',
                        style: theme.textTheme.subtitle2,
                      ),
                      const Gap(10),
                      TelleoTextButton(
                        text: 'Sign In',
                        onPressed: () {
                          context
                              .read<AuthFormBloc>()
                              .add(const AuthFormEvent.signIn());
                        },
                      ),
                      const Gap(10),
                      TelleoTextButton(
                        text: 'Sign up',
                        onPressed: () {
                          context
                              .read<AuthFormBloc>()
                              .add(const AuthFormEvent.signUp());
                        },
                        buttonTheme: TelloTextButtonTheme.reversed,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
