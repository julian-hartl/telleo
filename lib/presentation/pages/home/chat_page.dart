import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:telleo/domain/chats/chats_repository.dart';
import '../../../application/blocs/app/user/loader/user_bloc.dart';
import '../../../application/blocs/failures/chat_failure_bloc.dart';
import '../../utils/show_snackbar.dart';
import '../../../application/blocs/home/chat_page/chat_page_bloc.dart';
import '../../../domain/chats/message_entity.dart';
import '../../constants/padding.dart';
import '../../../utils/dependencies.dart';
import '../../../domain/chats/chat_entity.dart';
import '../../constants/decorations.dart';

class ChatPage extends HookWidget {
  final ChatEntity chat;

  const ChatPage({Key? key, required this.chat}) : super(key: key);
  static const profilePictureRadius = 20.0;

  static final smallMessagePadding = EdgeInsets.only(
    left: pagePadding.left,
    right: pagePadding.right,
    top: pagePadding.top / 2,
  );
  static final normalMessagePadding = EdgeInsets.only(
    left: pagePadding.left,
    right: pagePadding.right,
    top: pagePadding.top,
  );

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = useTextEditingController();
    return BlocProvider(
      create: (context) => ChatPageBloc(chat, app.get<ChatsRepository>()),
      child: BlocBuilder<ChatPageBloc, ChatPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: profilePictureRadius,
                    foregroundImage:
                        NetworkImage(chat.contact.profilePictureUrl),
                    child: const CircularProgressIndicator(),
                  ),
                  const Gap(10),
                  Text(
                    chat.contact.email
                        .replaceRange(10, chat.contact.email.length, '...'),
                  ),
                ],
              ),
            ),
            body: BlocListener<ChatFailureBloc, ChatFailureState>(
              listener: (context, state) {
                state.maybeWhen(
                    initial: () {},
                    orElse: () => showErrorSnackbar(context,
                        message: 'Could not send message...'));
              },
              child: state.map(
                loadingMessages: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                loadingSuccess: (success) {
                  final messages = success.messages;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final message = messages[index];

                            final lastMessage =
                                index > 0 ? messages[index - 1] : null;
                            final padding = lastMessage != null
                                ? (lastMessage.sender == message.sender
                                    ? smallMessagePadding
                                    : normalMessagePadding)
                                : normalMessagePadding;
                            return Padding(
                              padding: padding,
                              child: BlocBuilder<UserBloc, UserState>(
                                builder: (context, state) {
                                  bool isSender;
                                  isSender = state.maybeMap(
                                      loadingSuccess: (success) =>
                                          success.user.uid == message.sender,
                                      orElse: () => throw Error());
                                  return MessageTile(
                                      isSender: isSender, message: message);
                                },
                              ),
                            );
                          },
                          itemCount: messages.size,
                          shrinkWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              decoration: outlineInputDecoration(
                                Theme.of(context),
                                hint: 'Message',
                              ),
                              controller: messageController,
                            )),
                            IconButton(
                                onPressed: () {
                                  context.read<ChatPageBloc>().add(
                                        ChatPageEvent.sendMessage(
                                            currentChat: chat,
                                            message: messageController.text),
                                      );
                                  messageController.clear();
                                },
                                icon: const Icon(Icons.send))
                          ],
                        ),
                      )
                    ],
                  );
                },
                loadingFailure: (failure) => Center(
                  child: Text(
                    failure.message,
                  ),
                ),
                initial: (_) => Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.isSender,
    required this.message,
  }) : super(key: key);

  final bool isSender;
  final MessageEntity message;

  static const messagePadding =
      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0);
  static const messageBorderRadius = 10.0;
  static const maxWidthMultiplier = 0.6;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * maxWidthMultiplier,
        ),
        child: Container(
          padding: messagePadding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(messageBorderRadius),
          ),
          child: Text(
            message.content,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ),
      ),
    );
  }
}
