import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telleo/application/blocs/home/search_users_page/search_users_bloc.dart';
import 'package:telleo/domain/user/user_repository.dart';
import 'package:telleo/utils/dependencies.dart';

class SearchUsersPage extends StatelessWidget {
  const SearchUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUsersBloc, SearchUsersState>(
      builder: (context, state) {
        final usersAsync = state.users;
        return usersAsync.map(
          data: (data) {
            final users = data.data;
            return users.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(user.email.getOrCrash()),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: users.length,
                  )
                : Center(
                    child: Text(
                      'No users found.',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  );
          },
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err) => Center(
            child: Text(err.message),
          ),
        );
      },
    );
  }
}
