import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/home/search_users_page/search_users_bloc.dart';

class SearchUsersPage extends StatelessWidget {
  const SearchUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchUsersBloc(),
      child: const Center(
        child: Text('Search users page'),
      ),
    );
  }
}
