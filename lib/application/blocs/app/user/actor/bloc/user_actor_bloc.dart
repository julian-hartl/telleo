import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/application/blocs/app/user/loader/user_bloc.dart';
import 'package:telleo/domain/user/user_entity.dart';

part 'user_actor_event.dart';
part 'user_actor_state.dart';
part 'user_actor_bloc.freezed.dart';

/*
* Note that this blocs only task is to perform mutations on the currently in memory stored user (not to save data to any kind of database)
 */
@lazySingleton
class UserActorBloc extends Bloc<UserActorEvent, UserActorState> {
  final UserBloc userBloc;
  UserActorBloc(this.userBloc) : super(const UserActorState.initial()) {
    on<_UpdateUser>((event, emit) {
      userBloc.add(UserEvent.updateUser(event.user));
    });
  }
}
