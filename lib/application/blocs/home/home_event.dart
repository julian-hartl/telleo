part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.increment() = HomeIncrement;
  const factory HomeEvent.decrement() = HomeDecrement;
}
