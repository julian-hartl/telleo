import 'package:flutter/material.dart';
import '../../../domain/core/services/socket_service/socket_service.dart';
import '../../../utils/dependencies.dart';

import 'chats_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    app.get<SocketService>().connect();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsPage(),
    );
  }
}
