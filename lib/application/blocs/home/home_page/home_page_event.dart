part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.startedSearching() = _StartedSearching;
  const factory HomePageEvent.stoppedSearching() = _StoppedSearching;
}
