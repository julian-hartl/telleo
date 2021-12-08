import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import '../../../application/blocs/home/chat_page/chat_page_bloc.dart';
import '../../../domain/chats/message_entity.dart';
import '../../../domain/user/user_state.dart';
import '../../constants/padding.dart';
import '../../../utils/dependencies.dart';
import '../../../domain/chats/chat_entity.dart';
import '../../constants/decorations.dart';

class ChatPage extends HookWidget {
  final ChatPageBloc bloc;

  const ChatPage({Key? key, required this.bloc}) : super(key: key);
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

    return BlocConsumer<ChatPageBloc, ChatPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: profilePictureRadius,
                    foregroundImage: NetworkImage(
                      state.chat.contact.profilePictureUrl.getOrElse(
                        (failure) =>
                            'https://www.senertec.de/wp-content/uploads/2020/04/blank-profile-picture-973460_1280.png',
                      ),
                    ),
                    child: const CircularProgressIndicator(),
                  ),
                  const Gap(10),
                  Text(
                    state.chat.contact.name.value.fold((l) => 'Name', (r) => r),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final message = state.chat.messages[index];
                      final isSender =
                          bloc.currentUserIsSender(message.sender.uid);
                      final lastMessage =
                          index > 0 ? state.chat.messages[index - 1] : null;
                      final padding = lastMessage != null
                          ? (lastMessage.sender.uid.getOrCrash() ==
                                  message.sender.uid.getOrCrash()
                              ? smallMessagePadding
                              : normalMessagePadding)
                          : normalMessagePadding;
                      return Padding(
                        padding: padding,
                        child:
                            MessageTile(isSender: isSender, message: message),
                      );
                    },
                    itemCount: state.chat.messages.length,
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
                            bloc.add(
                              ChatPageEvent.sendMessage(messageController.text),
                            );
                            messageController.clear();
                          },
                          icon: const Icon(Icons.send))
                    ],
                  ),
                )
              ],
            ));
      },
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
