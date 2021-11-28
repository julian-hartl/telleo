import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telleo/application/blocs/auth/auth_bloc.dart';
import 'package:telleo/domain/auth/auth_repository.dart';
import 'package:telleo/presentation/pages/auth/auth_page/auth_form.dart';
import 'package:telleo/utils/dependencies.dart';

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
        create: (context) => AuthBloc(app.get<AuthRepository>()),
        child: const AuthForm(),
      ),
    );
  }
}
