import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/presentation/pages/home/edit_profile_page.dart';
import 'package:telleo/presentation/routing/router.dart';

import '../../../application/blocs/app/chat/loader/chat_bloc.dart';
import '../../../application/blocs/app/user/loader/user_bloc.dart';
import '../../../application/blocs/home/home_page/home_page_bloc.dart';
import '../../../application/blocs/home/search_users_page/search_users_bloc.dart';
import '../../../domain/core/services/socket_service/socket_service.dart';
import '../../../utils/dependencies.dart';
import '../../constants/decorations.dart';
import '../../constants/padding.dart';
import 'chats_page.dart';
import 'search_users_page.dart';

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
    app.get<UserBloc>().add(const UserEvent.loadUser());
    app.get<ChatBloc>().add(const ChatEvent.loadChats());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => app.get<SearchUsersBloc>(),
        ),
        BlocProvider(
          create: (context) => app.get<HomePageBloc>(),
        ),
      ],
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);
  static const profilePictureRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      builder: (context, homeState) {
        return BlocBuilder<SearchUsersBloc, SearchUsersState>(
          builder: (context, searchState) {
            return Scaffold(
              appBar: homeState.map(
                  loadInProgress: (_) => _chatsAppBar(context),
                  chats: (_) => _chatsAppBar(context),
                  search: (_) => _searchAppBar(context),
                  initial: (_) => null),
              body: homeState.map(
                loadInProgress: (_) =>
                    const Center(child: CircularProgressIndicator()),
                chats: (_) => const ChatsPage(),
                search: (_) => const SearchUsersPage(),
                initial: (_) => Container(),
              ),
            );
          },
        );
      },
    );
  }

  AppBar _searchAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<HomePageBloc>()
                  .add(const HomePageEvent.stoppedSearching());
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Expanded(
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onEditingComplete: () {
                  context
                      .read<HomePageBloc>()
                      .add(const HomePageEvent.stoppedSearching());
                },
                autofocus: true,
                textAlignVertical: TextAlignVertical.bottom,
                decoration:
                    outlineInputDecoration(Theme.of(context), hint: 'Search'),
                onChanged: (value) => context.read<SearchUsersBloc>().add(
                      SearchUsersEvent.queryChanged(query: value),
                    ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }

  AppBar _chatsAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Telleo'),
      actions: [
        IconButton(
            onPressed: () {
              context
                  .read<HomePageBloc>()
                  .add(const HomePageEvent.startedSearching());
            },
            icon: const Icon(Icons.search)),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Padding(
              padding: pagePadding,
              child: state.map(
                initial: (_) => Container(),
                loadInProgress: (_) => const CircularProgressIndicator(),
                loadingSuccess: (success) => InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    AutoRouter.of(context)
                        .push(EditProfilePageRoute(user: success.user));
                  },
                  child: CircleAvatar(
                    radius: profilePictureRadius,
                    foregroundImage:
                        NetworkImage(success.user.profilePictureUrl),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                loadingFailure: (failure) => const CircleAvatar(
                  radius: profilePictureRadius,
                  child: Text('!'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
