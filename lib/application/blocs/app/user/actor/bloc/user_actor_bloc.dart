import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_actor_event.dart';
part 'user_actor_state.dart';
part 'user_actor_bloc.freezed.dart';

class UserActorBloc extends Bloc<UserActorEvent, UserActorState> {
  UserActorBloc() : super(const UserActorState.initial()) {}
}
