import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:telleo/application/blocs/app/chat/loader/chat_bloc.dart';

import '../../../application/blocs/home/chat_page/chat_page_bloc.dart';
import '../../../application/blocs/home/chats_page/chats_page_bloc.dart';
import '../../../domain/chats/chat_entity.dart';
import '../../../utils/dependencies.dart';
import '../../constants/colors.dart';
import '../../constants/padding.dart';
import '../../routing/router.dart';
import '../../widgets/telleo_widgets/telleo_text_button.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  static const profilePictureRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadingSuccess: (success) {
            final chats = success.chats;
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ChatItem(
                  chat: chats[index],
                  onTap: () {
                    AutoRouter.of(context).push(
                      ChatPageRoute(
                        chat: chats[index],
                      ),
                    );
                  }),
              itemCount: chats.size,
            );
          },
          loadingFailure: (failure) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Whoops, something went wrong...'),
              const Gap(10),
              TelleoTextButton(
                text: 'Retry',
                onPressed: () {
                  context
                      .read<ChatsPageBloc>()
                      .add(const ChatsPageEvent.retry());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final ChatEntity chat;
  final VoidCallback onTap;
  const ChatItem({Key? key, required this.chat, required this.onTap})
      : super(key: key);

  static const profilePictureRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    final contact = chat.contact;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: pagePadding,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: dimmedColor),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: profilePictureRadius,
              foregroundImage: NetworkImage(contact.profilePictureUrl),
              child: const CircularProgressIndicator(),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contact.email,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                    chat.messages.isNotEmpty ? chat.messages.last.content : ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
