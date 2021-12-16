import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:telleo/application/blocs/app/user/actor/bloc/user_actor_bloc.dart';
import 'package:telleo/application/blocs/app/user/loader/user_bloc.dart';
import 'package:telleo/domain/core/value_objects.dart';
import 'package:telleo/domain/user/user_failures.dart';
import 'package:telleo/domain/user/user_repository.dart';

part 'edit_profile_page_event.dart';
part 'edit_profile_page_state.dart';
part 'edit_profile_page_bloc.freezed.dart';

@lazySingleton
class EditProfilePageBloc
    extends Bloc<EditProfilePageEvent, EditProfilePageState> {
  final UserRepository userRepository;
  final UserBloc userBloc;
  final UserActorBloc userActorBloc;
  EditProfilePageBloc(this.userRepository, this.userBloc, this.userActorBloc)
      : super(EditProfilePageState.inital()) {
    on<_Initialize>((event, emit) {
      emit(
        state.copyWith(
          emailAdress: EmailAdress(event.email),
          username: Name(event.username),
          profilePicturePath: event.profilePictureUrl,
          isUpdating: false,
          showErrorMessages: false,
          userFailureOrSuccess: none(),
        ),
      );
    });
    on<_EmailChanged>((event, emit) =>
        emit(state.copyWith(emailAdress: EmailAdress(event.email))));
    on<_UsernameChanged>(
        (event, emit) => emit(state.copyWith(username: Name(event.username))));
    on<_Save>((event, emit) async {
      final isEmailValid = state.emailAdress.isValid();
      final isUsernameValid = state.username.isValid();
      if (!isEmailValid || !isUsernameValid) {
        emit(state.copyWith(showErrorMessages: true));
      } else {
        emit(state.copyWith(isUpdating: true));
        final email = state.emailAdress.getOrCrash();
        final username = state.username.getOrCrash();
        final currentUser = await userBloc.getCurrentUser();
        final result = await userRepository.updateUser(currentUser.copyWith(
          email: email,
          name: username,
        ));
        result.fold((failure) {
          emit(
            state.copyWith(
              userFailureOrSuccess: some(
                left(failure),
              ),
              isUpdating: false,
            ),
          );
        }, (user) {
          userActorBloc.add(UserActorEvent.updateUser(user));
          emit(state.copyWith(
            userFailureOrSuccess: some(right(unit)),
          ));
        });
      }
    });
  }
}
