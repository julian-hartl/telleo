// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  CancelledByUser cancelledByUser() {
    return const CancelledByUser();
  }

  InvalidEmailPasswordCombination invalidEmailPasswordCombination() {
    return const InvalidEmailPasswordCombination();
  }

  EmailAlreadyInUse emailAlreadyInUse() {
    return const EmailAlreadyInUse();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() emailAlreadyInUse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() emailAlreadyInUse,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
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
    required TResult Function(ServerError value) serverError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $CancelledByUserCopyWith<$Res> {
  factory $CancelledByUserCopyWith(
          CancelledByUser value, $Res Function(CancelledByUser) then) =
      _$CancelledByUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelledByUserCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $CancelledByUserCopyWith<$Res> {
  _$CancelledByUserCopyWithImpl(
      CancelledByUser _value, $Res Function(CancelledByUser) _then)
      : super(_value, (v) => _then(v as CancelledByUser));

  @override
  CancelledByUser get _value => super._value as CancelledByUser;
}

/// @nodoc

class _$CancelledByUser implements CancelledByUser {
  const _$CancelledByUser();

  @override
  String toString() {
    return 'AuthFailure.cancelledByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CancelledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() emailAlreadyInUse,
  }) {
    return cancelledByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
  }) {
    return cancelledByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
  }) {
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
  }) {
    return cancelledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUser implements AuthFailure {
  const factory CancelledByUser() = _$CancelledByUser;
}

/// @nodoc
abstract class $InvalidEmailPasswordCombinationCopyWith<$Res> {
  factory $InvalidEmailPasswordCombinationCopyWith(
          InvalidEmailPasswordCombination value,
          $Res Function(InvalidEmailPasswordCombination) then) =
      _$InvalidEmailPasswordCombinationCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidEmailPasswordCombinationCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidEmailPasswordCombinationCopyWith<$Res> {
  _$InvalidEmailPasswordCombinationCopyWithImpl(
      InvalidEmailPasswordCombination _value,
      $Res Function(InvalidEmailPasswordCombination) _then)
      : super(_value, (v) => _then(v as InvalidEmailPasswordCombination));

  @override
  InvalidEmailPasswordCombination get _value =>
      super._value as InvalidEmailPasswordCombination;
}

/// @nodoc

class _$InvalidEmailPasswordCombination
    implements InvalidEmailPasswordCombination {
  const _$InvalidEmailPasswordCombination();

  @override
  String toString() {
    return 'AuthFailure.invalidEmailPasswordCombination()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmailPasswordCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() emailAlreadyInUse,
  }) {
    return invalidEmailPasswordCombination();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
  }) {
    return invalidEmailPasswordCombination?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (invalidEmailPasswordCombination != null) {
      return invalidEmailPasswordCombination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
  }) {
    return invalidEmailPasswordCombination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
  }) {
    return invalidEmailPasswordCombination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (invalidEmailPasswordCombination != null) {
      return invalidEmailPasswordCombination(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailPasswordCombination implements AuthFailure {
  const factory InvalidEmailPasswordCombination() =
      _$InvalidEmailPasswordCombination;
}

/// @nodoc
abstract class $EmailAlreadyInUseCopyWith<$Res> {
  factory $EmailAlreadyInUseCopyWith(
          EmailAlreadyInUse value, $Res Function(EmailAlreadyInUse) then) =
      _$EmailAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $EmailAlreadyInUseCopyWith<$Res> {
  _$EmailAlreadyInUseCopyWithImpl(
      EmailAlreadyInUse _value, $Res Function(EmailAlreadyInUse) _then)
      : super(_value, (v) => _then(v as EmailAlreadyInUse));

  @override
  EmailAlreadyInUse get _value => super._value as EmailAlreadyInUse;
}

/// @nodoc

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() emailAlreadyInUse,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AuthFailure {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}
