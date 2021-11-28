// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chats_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatsPageEventTearOff {
  const _$ChatsPageEventTearOff();

  _Started started() {
    return const _Started();
  }
}

/// @nodoc
const $ChatsPageEvent = _$ChatsPageEventTearOff();

/// @nodoc
mixin _$ChatsPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsPageEventCopyWith<$Res> {
  factory $ChatsPageEventCopyWith(
          ChatsPageEvent value, $Res Function(ChatsPageEvent) then) =
      _$ChatsPageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsPageEventCopyWithImpl<$Res>
    implements $ChatsPageEventCopyWith<$Res> {
  _$ChatsPageEventCopyWithImpl(this._value, this._then);

  final ChatsPageEvent _value;
  // ignore: unused_field
  final $Res Function(ChatsPageEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$ChatsPageEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ChatsPageEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ChatsPageEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
class _$ChatsPageStateTearOff {
  const _$ChatsPageStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _ChatsPageState call({required List<ChatEntity> chats}) {
    return _ChatsPageState(
      chats: chats,
    );
  }
}

/// @nodoc
const $ChatsPageState = _$ChatsPageStateTearOff();

/// @nodoc
mixin _$ChatsPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats) $default, {
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats)? $default, {
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats)? $default, {
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChatsPageState value) $default, {
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ChatsPageState value)? $default, {
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChatsPageState value)? $default, {
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsPageStateCopyWith<$Res> {
  factory $ChatsPageStateCopyWith(
          ChatsPageState value, $Res Function(ChatsPageState) then) =
      _$ChatsPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsPageStateCopyWithImpl<$Res>
    implements $ChatsPageStateCopyWith<$Res> {
  _$ChatsPageStateCopyWithImpl(this._value, this._then);

  final ChatsPageState _value;
  // ignore: unused_field
  final $Res Function(ChatsPageState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ChatsPageStateCopyWithImpl<$Res>
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
    return 'ChatsPageState.initial()';
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
  TResult when<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats) $default, {
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats)? $default, {
    TResult Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats)? $default, {
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChatsPageState value) $default, {
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ChatsPageState value)? $default, {
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChatsPageState value)? $default, {
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatsPageState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ChatsPageStateCopyWith<$Res> {
  factory _$ChatsPageStateCopyWith(
          _ChatsPageState value, $Res Function(_ChatsPageState) then) =
      __$ChatsPageStateCopyWithImpl<$Res>;
  $Res call({List<ChatEntity> chats});
}

/// @nodoc
class __$ChatsPageStateCopyWithImpl<$Res>
    extends _$ChatsPageStateCopyWithImpl<$Res>
    implements _$ChatsPageStateCopyWith<$Res> {
  __$ChatsPageStateCopyWithImpl(
      _ChatsPageState _value, $Res Function(_ChatsPageState) _then)
      : super(_value, (v) => _then(v as _ChatsPageState));

  @override
  _ChatsPageState get _value => super._value as _ChatsPageState;

  @override
  $Res call({
    Object? chats = freezed,
  }) {
    return _then(_ChatsPageState(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
    ));
  }
}

/// @nodoc

class _$_ChatsPageState implements _ChatsPageState {
  const _$_ChatsPageState({required this.chats});

  @override
  final List<ChatEntity> chats;

  @override
  String toString() {
    return 'ChatsPageState(chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatsPageState &&
            const DeepCollectionEquality().equals(other.chats, chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chats));

  @JsonKey(ignore: true)
  @override
  _$ChatsPageStateCopyWith<_ChatsPageState> get copyWith =>
      __$ChatsPageStateCopyWithImpl<_ChatsPageState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats) $default, {
    required TResult Function() initial,
  }) {
    return $default(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats)? $default, {
    TResult Function()? initial,
  }) {
    return $default?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ChatEntity> chats)? $default, {
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChatsPageState value) $default, {
    required TResult Function(_Initial value) initial,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ChatsPageState value)? $default, {
    TResult Function(_Initial value)? initial,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChatsPageState value)? $default, {
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ChatsPageState implements ChatsPageState {
  const factory _ChatsPageState({required List<ChatEntity> chats}) =
      _$_ChatsPageState;

  List<ChatEntity> get chats;
  @JsonKey(ignore: true)
  _$ChatsPageStateCopyWith<_ChatsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
