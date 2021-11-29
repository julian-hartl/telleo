import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/chats/chats_bloc.dart';

import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/presentation/utils/show_snackbar.dart';
import 'package:telleo/utils/dependencies.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          app.get<ChatsBloc>()..add(const ChatsEvent.requestChats()),
      child: BlocProvider(
        create: (context) => ChatsPageBloc(),
        child: BlocListener<ChatsBloc, ChatsState>(
          listener: (context, state) {
            state.map(loading: (_) {
              app.get<ILogger>().logInfo('Loading');
            }, retrieved: (_) {
              app.get<ILogger>().logInfo('Retrieved');
            }, error: (err) {
              app.get<ILogger>().logInfo('Error');

              showErrorSnackbar(context, message: err.message);
            }, inital: (_) {
              app.get<ILogger>().logInfo('Initial');
              // context.read<ChatsBloc>().add(const ChatsEvent.requestChats());
            });
          },
          child: const Scaffold(
              body: Center(
            child: Text('ChatsPage'),
          )),
        ),
      ),
    );
  }
}
