part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.loadInProgress() = _LoadInProgress;
  const factory HomePageState.chats() = _Chats;
  const factory HomePageState.search() = _Search;

  const factory HomePageState.initial() = _Initial;
}
