import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/app/bloc/app_bloc.dart';
import 'package:telleo/application/blocs/home/chats_page/chats_page_bloc.dart';
import 'package:telleo/application/blocs/home/home_page/home_page_bloc.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';
import 'package:telleo/presentation/constants/decorations.dart';
import 'package:telleo/presentation/constants/padding.dart';
import 'package:telleo/presentation/pages/home/search_users_page.dart';
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
    pageViewController = PageController(initialPage: 1);
    pageViewController.addListener(() {
      final value = pageViewController.page! < 0.5;
      if (value != isOnSearchPage) {
        setState(() {
          isOnSearchPage = value;
        });
      }
    });
  }

  late final PageController pageViewController;

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  static const profilePictureRadius = 20.0;
  static const pageAnimationDuration = Duration(milliseconds: 150);
  static const pageAnimationCurve = Curves.linear;

  bool isOnSearchPage = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(app.get<AppBloc>()),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (isOnSearchPage) {
                pageViewController.nextPage(
                  duration: pageAnimationDuration,
                  curve: pageAnimationCurve,
                );
                return false;
              }
              return true;
            },
            child: Scaffold(
              appBar: isOnSearchPage ? _searchAppBar() : _chatsAppBar(state),
              body: PageView(
                physics: const RangeMaintainingScrollPhysics(),
                controller: pageViewController,
                scrollDirection: Axis.horizontal,
                children: const [
                  SearchUsersPage(),
                  ChatsPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _searchAppBar() {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration:
                    outlineInputDecoration(Theme.of(context), hint: 'Search'),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
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
              pageViewController.animateToPage(
                0,
                duration: pageAnimationDuration,
                curve: pageAnimationCurve,
              );
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
