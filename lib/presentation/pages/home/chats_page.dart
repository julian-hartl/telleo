import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../application/blocs/home/chat_page/chat_page_bloc.dart';
import '../../../domain/core/dartz_option_ext.dart';
import '../../../domain/core/services/api_service/api_service.dart';
import '../../routing/router.dart';
import '../../../domain/core/services/logger.dart';
import '../../constants/colors.dart';
import '../../constants/padding.dart';
import '../../widgets/telleo_widgets/telleo_text_button.dart';

import '../../../application/blocs/app/bloc/app_bloc.dart';
import '../../../application/blocs/home/chats_page/chats_page_bloc.dart';
import '../../../domain/chats/chat_entity.dart';
import '../../../utils/dependencies.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  static const profilePictureRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatsPageBloc(app.get<AppBloc>(), app.get<ApiService>()),
      child: BlocBuilder<ChatsPageBloc, ChatsPageState>(
        builder: (context, state) {
          return Column(
            children: [
              state.chats.map(
                data: (data) {
                  final chats = data.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ChatItem(
                        chat: chats[index],
                        onTap: () {
                          AutoRouter.of(context).push(
                            ChatPageRoute(
                              bloc: ChatPageBloc(
                                chat: chats[index],
                              ),
                            ),
                          );
                        }),
                    itemCount: chats.length,
                  );
                },
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (err) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(err.message),
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
              ),
            ],
          );
        },
      ),
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
              foregroundImage: NetworkImage(
                contact.profilePictureUrl.getOrElse(
                  (failure) =>
                      'https://www.senertec.de/wp-content/uploads/2020/04/blank-profile-picture-973460_1280.png',
                ),
              ),
              child: const CircularProgressIndicator(),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contact.name.getOrCrash(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(chat.messages.isNotEmpty
                    ? chat.messages.first.content
                    : ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
