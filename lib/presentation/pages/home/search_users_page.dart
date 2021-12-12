import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../application/blocs/app/chat/actor/chat_actor_bloc.dart';
import '../../../application/blocs/home/search_users_page/search_users_bloc.dart';
import '../../../domain/user/user_entity.dart';
import '../../../domain/user/user_repository.dart';
import '../../../utils/dependencies.dart';

class SearchUsersPage extends StatelessWidget {
  const SearchUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUsersBloc, SearchUsersState>(
      builder: (context, state) {
        return state.map(
          loadingSuccessful: (success) {
            final searchResults = success.results;
            return !searchResults.isEmpty()
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      final result = searchResults[index];
                      return _SearchUserResultTile(result: result);
                    },
                    itemCount: searchResults.size,
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
          loadingResults: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadingFailure: (failure) => const Center(
            child: Text('Whoops, something went wrong...'),
          ),
          initial: (_) => Container(),
        );
      },
    );
  }
}

class _SearchUserResultTile extends StatelessWidget {
  _SearchUserResultTile({
    Key? key,
    required this.result,
  })  : user = result.user,
        super(key: key);

  final SearchResult result;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(user.profilePictureUrl),
              ),
              const Gap(15),
              Text(user.email),
            ],
          ),
          if (!result.chatAlreadyExists)
            ElevatedButton(
              onPressed: () {
                context.read<ChatActorBloc>().add(
                      ChatActorEvent.addChat(
                        user.uid,
                      ),
                    );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8.0),
              ),
              child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}
