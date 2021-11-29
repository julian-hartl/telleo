// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chats_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatsFailureTearOff {
  const _$ChatsFailureTearOff();

  ChatsServerFailure serverError() {
    return const ChatsServerFailure();
  }

  NoConnectionFailure noConnection() {
    return const NoConnectionFailure();
  }
}

/// @nodoc
const $ChatsFailure = _$ChatsFailureTearOff();

/// @nodoc
mixin _$ChatsFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsServerFailure value) serverError,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatsServerFailure value)? serverError,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsServerFailure value)? serverError,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsFailureCopyWith<$Res> {
  factory $ChatsFailureCopyWith(
          ChatsFailure value, $Res Function(ChatsFailure) then) =
      _$ChatsFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsFailureCopyWithImpl<$Res> implements $ChatsFailureCopyWith<$Res> {
  _$ChatsFailureCopyWithImpl(this._value, this._then);

  final ChatsFailure _value;
  // ignore: unused_field
  final $Res Function(ChatsFailure) _then;
}

/// @nodoc
abstract class $ChatsServerFailureCopyWith<$Res> {
  factory $ChatsServerFailureCopyWith(
          ChatsServerFailure value, $Res Function(ChatsServerFailure) then) =
      _$ChatsServerFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatsServerFailureCopyWithImpl<$Res>
    extends _$ChatsFailureCopyWithImpl<$Res>
    implements $ChatsServerFailureCopyWith<$Res> {
  _$ChatsServerFailureCopyWithImpl(
      ChatsServerFailure _value, $Res Function(ChatsServerFailure) _then)
      : super(_value, (v) => _then(v as ChatsServerFailure));

  @override
  ChatsServerFailure get _value => super._value as ChatsServerFailure;
}

/// @nodoc

class _$ChatsServerFailure implements ChatsServerFailure {
  const _$ChatsServerFailure();

  @override
  String toString() {
    return 'ChatsFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatsServerFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() noConnection,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsServerFailure value) serverError,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatsServerFailure value)? serverError,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsServerFailure value)? serverError,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ChatsServerFailure implements ChatsFailure {
  const factory ChatsServerFailure() = _$ChatsServerFailure;
}

/// @nodoc
abstract class $NoConnectionFailureCopyWith<$Res> {
  factory $NoConnectionFailureCopyWith(
          NoConnectionFailure value, $Res Function(NoConnectionFailure) then) =
      _$NoConnectionFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionFailureCopyWithImpl<$Res>
    extends _$ChatsFailureCopyWithImpl<$Res>
    implements $NoConnectionFailureCopyWith<$Res> {
  _$NoConnectionFailureCopyWithImpl(
      NoConnectionFailure _value, $Res Function(NoConnectionFailure) _then)
      : super(_value, (v) => _then(v as NoConnectionFailure));

  @override
  NoConnectionFailure get _value => super._value as NoConnectionFailure;
}

/// @nodoc

class _$NoConnectionFailure implements NoConnectionFailure {
  const _$NoConnectionFailure();

  @override
  String toString() {
    return 'ChatsFailure.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoConnectionFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatsServerFailure value) serverError,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChatsServerFailure value)? serverError,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatsServerFailure value)? serverError,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnectionFailure implements ChatsFailure {
  const factory NoConnectionFailure() = _$NoConnectionFailure;
}
