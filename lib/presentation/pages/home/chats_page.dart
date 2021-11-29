import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../domain/chats/chat_entity.dart';
import '../../../domain/core/services/logger.dart';
import '../../widgets/telleo_widgets/telleo_text_button.dart';
import '../../../utils/dependencies.dart';

import '../../../application/blocs/home/chats_page/chats_page_bloc.dart';
import '../../utils/show_snackbar.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsPageBloc(),
      child: Scaffold(
        body: BlocConsumer<ChatsPageBloc, ChatsPageState>(
          listener: (context, state) {
            state.chats.maybeMap(
              error: (value) {
                showErrorSnackbar(context, message: value.message);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.chats.map(
              data: (chats) => ListView.builder(
                itemBuilder: (context, index) =>
                    ChatItem(chat: chats.data[index]),
                itemCount: chats.data.length,
              ),
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (err) => Column(
                children: [
                  Text(err.message),
                  const Gap(10),
                  TelleoTextButton(text: 'Retry', onPressed: () {})
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final ChatEntity chat;
  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(chat.contact.name.getOrCrash()),
    );
  }
}
