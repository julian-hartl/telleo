import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/blocs/auth/auth_form/auth_form_bloc.dart';

import '../../../../domain/auth/auth_repository.dart';
import 'auth_form.dart';
import '../../../../utils/dependencies.dart';

import '../../../routing/routing.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocProvider(
        create: (context) => AuthFormBloc(app.get<AuthRepository>()),
        child: const AuthForm(),
      ),
    );
  }
}
