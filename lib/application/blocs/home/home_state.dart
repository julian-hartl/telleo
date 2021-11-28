part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({required int counter}) = _HomeState;
  factory HomeState.initial() => const HomeState(counter: 0);
}
