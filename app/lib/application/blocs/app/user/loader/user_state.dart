part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loadInProgress() = _LoadingInProgress;
  const factory UserState.loadingSuccess(UserEntity user) = _LoadingSuccess;
  const factory UserState.loadingFailure(UserFailure failure) = _LoadingFailure;
}
