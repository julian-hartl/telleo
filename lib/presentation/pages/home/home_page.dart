import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';
import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/application/blocs/home/home_page/home_page_bloc.dart';
import 'package:telleo/application/blocs/home/search_users_page/search_users_bloc.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';
import 'package:telleo/domain/user/user_repository.dart';
import 'package:telleo/presentation/constants/decorations.dart';
import 'package:telleo/presentation/constants/padding.dart';
import 'package:telleo/presentation/pages/home/search_users_page.dart';
import 'package:telleo/presentation/widgets/isolated/switch_page.dart';
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
    pageViewController = PageController();
  }

  late final PageController pageViewController;

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  static const profilePictureRadius = 20.0;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => app.get<SearchUsersBloc>(),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(app.get<AppBloc>()),
        ),
      ],
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {},
        builder: (context, homeState) {
          return BlocBuilder<SearchUsersBloc, SearchUsersState>(
            builder: (context, searchState) {
              return Scaffold(
                appBar: isSearching
                    ? _searchAppBar(context)
                    : _chatsAppBar(homeState),
                body: SwitchPage(
                  currentPage: searchState.showSearch ? 1 : 0,
                  pages: const [
                    ChatsPage(),
                    SearchUsersPage(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  AppBar _searchAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onEditingComplete: () {
                  setState(() {
                    isSearching = false;
                  });
                  context.read<SearchUsersBloc>().add(
                        const SearchUsersEvent.onQueryChanged(query: ''),
                      );
                },
                autofocus: true,
                textAlignVertical: TextAlignVertical.bottom,
                decoration:
                    outlineInputDecoration(Theme.of(context), hint: 'Search'),
                onChanged: (value) => context.read<SearchUsersBloc>().add(
                      SearchUsersEvent.onQueryChanged(query: value),
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

  AppBar _chatsAppBar(HomePageState state) {
    return AppBar(
      title: const Text('Telleo'),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
            icon: const Icon(Icons.search)),
        Padding(
          padding: pagePadding,
          child: state.user.map(
            data: (value) => InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: CircleAvatar(
                radius: profilePictureRadius,
                foregroundImage: NetworkImage(
                  value.data.profilePictureUrl.value.getOrElse(
                    () =>
                        'https://www.senertec.de/wp-content/uploads/2020/04/blank-profile-picture-973460_1280.png',
                  ),
                ),
                child: const CircularProgressIndicator(),
              ),
            ),
            loading: (_) => const CircularProgressIndicator(),
            error: (_) {
              return Text('!');
            },
          ),
        ),
      ],
    );
  }
}
