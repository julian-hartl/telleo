// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chats_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatsEventTearOff {
  const _$ChatsEventTearOff();

  RequestChats requestChats() {
    return const RequestChats();
  }
}

/// @nodoc
const $ChatsEvent = _$ChatsEventTearOff();

/// @nodoc
mixin _$ChatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestChats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestChats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestChats,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestChats value) requestChats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestChats value)? requestChats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestChats value)? requestChats,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsEventCopyWith<$Res> {
  factory $ChatsEventCopyWith(
          ChatsEvent value, $Res Function(ChatsEvent) then) =
      _$ChatsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsEventCopyWithImpl<$Res> implements $ChatsEventCopyWith<$Res> {
  _$ChatsEventCopyWithImpl(this._value, this._then);

  final ChatsEvent _value;
  // ignore: unused_field
  final $Res Function(ChatsEvent) _then;
}

/// @nodoc
abstract class $RequestChatsCopyWith<$Res> {
  factory $RequestChatsCopyWith(
          RequestChats value, $Res Function(RequestChats) then) =
      _$RequestChatsCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestChatsCopyWithImpl<$Res> extends _$ChatsEventCopyWithImpl<$Res>
    implements $RequestChatsCopyWith<$Res> {
  _$RequestChatsCopyWithImpl(
      RequestChats _value, $Res Function(RequestChats) _then)
      : super(_value, (v) => _then(v as RequestChats));

  @override
  RequestChats get _value => super._value as RequestChats;
}

/// @nodoc

class _$RequestChats implements RequestChats {
  const _$RequestChats();

  @override
  String toString() {
    return 'ChatsEvent.requestChats()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestChats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestChats,
  }) {
    return requestChats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestChats,
  }) {
    return requestChats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestChats,
    required TResult orElse(),
  }) {
    if (requestChats != null) {
      return requestChats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestChats value) requestChats,
  }) {
    return requestChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RequestChats value)? requestChats,
  }) {
    return requestChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestChats value)? requestChats,
    required TResult orElse(),
  }) {
    if (requestChats != null) {
      return requestChats(this);
    }
    return orElse();
  }
}

abstract class RequestChats implements ChatsEvent {
  const factory RequestChats() = _$RequestChats;
}

/// @nodoc
class _$ChatsStateTearOff {
  const _$ChatsStateTearOff();

  LoadingChats loading() {
    return const LoadingChats();
  }

  RetrievedChats retrieved() {
    return const RetrievedChats();
  }

  ErrorLoadingChats error({required String message}) {
    return ErrorLoadingChats(
      message: message,
    );
  }

  _Initial inital() {
    return const _Initial();
  }
}

/// @nodoc
const $ChatsState = _$ChatsStateTearOff();

/// @nodoc
mixin _$ChatsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() retrieved,
    required TResult Function(String message) error,
    required TResult Function() inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingChats value) loading,
    required TResult Function(RetrievedChats value) retrieved,
    required TResult Function(ErrorLoadingChats value) error,
    required TResult Function(_Initial value) inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res> implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  final ChatsState _value;
  // ignore: unused_field
  final $Res Function(ChatsState) _then;
}

/// @nodoc
abstract class $LoadingChatsCopyWith<$Res> {
  factory $LoadingChatsCopyWith(
          LoadingChats value, $Res Function(LoadingChats) then) =
      _$LoadingChatsCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingChatsCopyWithImpl<$Res> extends _$ChatsStateCopyWithImpl<$Res>
    implements $LoadingChatsCopyWith<$Res> {
  _$LoadingChatsCopyWithImpl(
      LoadingChats _value, $Res Function(LoadingChats) _then)
      : super(_value, (v) => _then(v as LoadingChats));

  @override
  LoadingChats get _value => super._value as LoadingChats;
}

/// @nodoc

class _$LoadingChats implements LoadingChats {
  const _$LoadingChats();

  @override
  String toString() {
    return 'ChatsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingChats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() retrieved,
    required TResult Function(String message) error,
    required TResult Function() inital,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingChats value) loading,
    required TResult Function(RetrievedChats value) retrieved,
    required TResult Function(ErrorLoadingChats value) error,
    required TResult Function(_Initial value) inital,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingChats implements ChatsState {
  const factory LoadingChats() = _$LoadingChats;
}

/// @nodoc
abstract class $RetrievedChatsCopyWith<$Res> {
  factory $RetrievedChatsCopyWith(
          RetrievedChats value, $Res Function(RetrievedChats) then) =
      _$RetrievedChatsCopyWithImpl<$Res>;
}

/// @nodoc
class _$RetrievedChatsCopyWithImpl<$Res> extends _$ChatsStateCopyWithImpl<$Res>
    implements $RetrievedChatsCopyWith<$Res> {
  _$RetrievedChatsCopyWithImpl(
      RetrievedChats _value, $Res Function(RetrievedChats) _then)
      : super(_value, (v) => _then(v as RetrievedChats));

  @override
  RetrievedChats get _value => super._value as RetrievedChats;
}

/// @nodoc

class _$RetrievedChats implements RetrievedChats {
  const _$RetrievedChats();

  @override
  String toString() {
    return 'ChatsState.retrieved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RetrievedChats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() retrieved,
    required TResult Function(String message) error,
    required TResult Function() inital,
  }) {
    return retrieved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
  }) {
    return retrieved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (retrieved != null) {
      return retrieved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingChats value) loading,
    required TResult Function(RetrievedChats value) retrieved,
    required TResult Function(ErrorLoadingChats value) error,
    required TResult Function(_Initial value) inital,
  }) {
    return retrieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
  }) {
    return retrieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
    required TResult orElse(),
  }) {
    if (retrieved != null) {
      return retrieved(this);
    }
    return orElse();
  }
}

abstract class RetrievedChats implements ChatsState {
  const factory RetrievedChats() = _$RetrievedChats;
}

/// @nodoc
abstract class $ErrorLoadingChatsCopyWith<$Res> {
  factory $ErrorLoadingChatsCopyWith(
          ErrorLoadingChats value, $Res Function(ErrorLoadingChats) then) =
      _$ErrorLoadingChatsCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorLoadingChatsCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res>
    implements $ErrorLoadingChatsCopyWith<$Res> {
  _$ErrorLoadingChatsCopyWithImpl(
      ErrorLoadingChats _value, $Res Function(ErrorLoadingChats) _then)
      : super(_value, (v) => _then(v as ErrorLoadingChats));

  @override
  ErrorLoadingChats get _value => super._value as ErrorLoadingChats;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ErrorLoadingChats(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorLoadingChats implements ErrorLoadingChats {
  const _$ErrorLoadingChats({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ChatsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorLoadingChats &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  $ErrorLoadingChatsCopyWith<ErrorLoadingChats> get copyWith =>
      _$ErrorLoadingChatsCopyWithImpl<ErrorLoadingChats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() retrieved,
    required TResult Function(String message) error,
    required TResult Function() inital,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingChats value) loading,
    required TResult Function(RetrievedChats value) retrieved,
    required TResult Function(ErrorLoadingChats value) error,
    required TResult Function(_Initial value) inital,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorLoadingChats implements ChatsState {
  const factory ErrorLoadingChats({required String message}) =
      _$ErrorLoadingChats;

  String get message;
  @JsonKey(ignore: true)
  $ErrorLoadingChatsCopyWith<ErrorLoadingChats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ChatsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ChatsState.inital()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() retrieved,
    required TResult Function(String message) error,
    required TResult Function() inital,
  }) {
    return inital();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
  }) {
    return inital?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? retrieved,
    TResult Function(String message)? error,
    TResult Function()? inital,
    required TResult orElse(),
  }) {
    if (inital != null) {
      return inital();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingChats value) loading,
    required TResult Function(RetrievedChats value) retrieved,
    required TResult Function(ErrorLoadingChats value) error,
    required TResult Function(_Initial value) inital,
  }) {
    return inital(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
  }) {
    return inital?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingChats value)? loading,
    TResult Function(RetrievedChats value)? retrieved,
    TResult Function(ErrorLoadingChats value)? error,
    TResult Function(_Initial value)? inital,
    required TResult orElse(),
  }) {
    if (inital != null) {
      return inital(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatsState {
  const factory _Initial() = _$_Initial;
}
