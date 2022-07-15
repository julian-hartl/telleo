part of 'user_form_bloc.dart';

@freezed
class UserFormEvent with _$UserFormEvent {
  const factory UserFormEvent.submit() = _Submit;
  const factory UserFormEvent.onNameChanged() = _OnNameChanged;
  const factory UserFormEvent.onProfilePictureUrlChanged() =
      _OnProfilePictureUrlChanged;
}
