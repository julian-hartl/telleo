import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:telleo/domain/core/dartz_option_ext.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';
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
      child: Scaffold(
        body: BlocBuilder<ChatsPageBloc, ChatsPageState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Telleo'),
                actions: [
                  Padding(
                    padding: pagePadding,
                    child: state.user.map(
                      data: (value) => InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {},
                        child: CircleAvatar(
                          radius: profilePictureRadius,
                          foregroundImage: NetworkImage(
                            value.data.profilePictureUrl
                                .getOrCrash()
                                .getOrCrash(),
                          ),
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                      loading: (_) => const CircularProgressIndicator(),
                      error: (_) => throw Error(),
                    ),
                  )
                ],
              ),
              body: Column(
                children: [
                  state.chats.map(
                    data: (data) {
                      final chats = data.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ChatItem(
                          chat: chats[index],
                        ),
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
                  state.test.map(
                      data: (data) => Text(data.data),
                      loading: (_) => const CircularProgressIndicator(),
                      error: (_) => Container())
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

  static const profilePictureRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    final contact = chat.contact;
    return InkWell(
      onTap: () {},
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
                contact.profilePictureUrl.getOrCrash().getOrCrash(),
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
                Text(chat.messages.isNotEmpty ? chat.messages.first : ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
