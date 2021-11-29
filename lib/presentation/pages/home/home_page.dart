import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/chats/chats_state.dart';

import 'chats_page.dart';
import '../../../utils/dependencies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      app.get<ChatsState>().load();
    });
    return Scaffold(
      body: const ChatsPage(),
    );
  }
}
