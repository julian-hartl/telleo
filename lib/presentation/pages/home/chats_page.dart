import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/blocs/app/bloc/app_bloc.dart';
import '../../../application/blocs/home/chats_page/chats_page_bloc.dart';
import '../../../domain/chats/chat_entity.dart';
import '../../../utils/dependencies.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsPageBloc(app.get<AppBloc>()),
      child: Scaffold(
        body: BlocBuilder<ChatsPageBloc, ChatsPageState>(
          builder: (context, state) {
            return state.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            ChatItem(chat: state.chats[index]),
                        itemCount: state.chats.length,
                      ),
                      /*
              Text(err.message),
                  const Gap(10),
                  TelleoTextButton(text: 'Retry', onPressed: () {})
                  */
                    ],
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
