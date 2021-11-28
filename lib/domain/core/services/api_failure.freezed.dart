// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApiFailureTearOff {
  const _$ApiFailureTearOff();

  InvalidAccessTokenFailure invalidAccessToken() {
    return const InvalidAccessTokenFailure();
  }

  InternalServerError internalServerError({required String errorMessage}) {
    return InternalServerError(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $ApiFailure = _$ApiFailureTearOff();

/// @nodoc
mixin _$ApiFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidAccessToken,
    required TResult Function(String errorMessage) internalServerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidAccessToken,
    TResult Function(String errorMessage)? internalServerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidAccessToken,
    TResult Function(String errorMessage)? internalServerError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidAccessTokenFailure value)
        invalidAccessToken,
    required TResult Function(InternalServerError value) internalServerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidAccessTokenFailure value)? invalidAccessToken,
    TResult Function(InternalServerError value)? internalServerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidAccessTokenFailure value)? invalidAccessToken,
    TResult Function(InternalServerError value)? internalServerError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res> implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  final ApiFailure _value;
  // ignore: unused_field
  final $Res Function(ApiFailure) _then;
}

/// @nodoc
abstract class $InvalidAccessTokenFailureCopyWith<$Res> {
  factory $InvalidAccessTokenFailureCopyWith(InvalidAccessTokenFailure value,
          $Res Function(InvalidAccessTokenFailure) then) =
      _$InvalidAccessTokenFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidAccessTokenFailureCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res>
    implements $InvalidAccessTokenFailureCopyWith<$Res> {
  _$InvalidAccessTokenFailureCopyWithImpl(InvalidAccessTokenFailure _value,
      $Res Function(InvalidAccessTokenFailure) _then)
      : super(_value, (v) => _then(v as InvalidAccessTokenFailure));

  @override
  InvalidAccessTokenFailure get _value =>
      super._value as InvalidAccessTokenFailure;
}

/// @nodoc

class _$InvalidAccessTokenFailure implements InvalidAccessTokenFailure {
  const _$InvalidAccessTokenFailure();

  @override
  String toString() {
    return 'ApiFailure.invalidAccessToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidAccessTokenFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidAccessToken,
    required TResult Function(String errorMessage) internalServerError,
  }) {
    return invalidAccessToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidAccessToken,
    TResult Function(String errorMessage)? internalServerError,
  }) {
    return invalidAccessToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidAccessToken,
    TResult Function(String errorMessage)? internalServerError,
    required TResult orElse(),
  }) {
    if (invalidAccessToken != null) {
      return invalidAccessToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidAccessTokenFailure value)
        invalidAccessToken,
    required TResult Function(InternalServerError value) internalServerError,
  }) {
    return invalidAccessToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidAccessTokenFailure value)? invalidAccessToken,
    TResult Function(InternalServerError value)? internalServerError,
  }) {
    return invalidAccessToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidAccessTokenFailure value)? invalidAccessToken,
    TResult Function(InternalServerError value)? internalServerError,
    required TResult orElse(),
  }) {
    if (invalidAccessToken != null) {
      return invalidAccessToken(this);
    }
    return orElse();
  }
}

abstract class InvalidAccessTokenFailure implements ApiFailure {
  const factory InvalidAccessTokenFailure() = _$InvalidAccessTokenFailure;
}

/// @nodoc
abstract class $InternalServerErrorCopyWith<$Res> {
  factory $InternalServerErrorCopyWith(
          InternalServerError value, $Res Function(InternalServerError) then) =
      _$InternalServerErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$InternalServerErrorCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res>
    implements $InternalServerErrorCopyWith<$Res> {
  _$InternalServerErrorCopyWithImpl(
      InternalServerError _value, $Res Function(InternalServerError) _then)
      : super(_value, (v) => _then(v as InternalServerError));

  @override
  InternalServerError get _value => super._value as InternalServerError;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(InternalServerError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InternalServerError implements InternalServerError {
  const _$InternalServerError({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ApiFailure.internalServerError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InternalServerError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  $InternalServerErrorCopyWith<InternalServerError> get copyWith =>
      _$InternalServerErrorCopyWithImpl<InternalServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidAccessToken,
    required TResult Function(String errorMessage) internalServerError,
  }) {
    return internalServerError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidAccessToken,
    TResult Function(String errorMessage)? internalServerError,
  }) {
    return internalServerError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidAccessToken,
    TResult Function(String errorMessage)? internalServerError,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidAccessTokenFailure value)
        invalidAccessToken,
    required TResult Function(InternalServerError value) internalServerError,
  }) {
    return internalServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidAccessTokenFailure value)? invalidAccessToken,
    TResult Function(InternalServerError value)? internalServerError,
  }) {
    return internalServerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidAccessTokenFailure value)? invalidAccessToken,
    TResult Function(InternalServerError value)? internalServerError,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(this);
    }
    return orElse();
  }
}

abstract class InternalServerError implements ApiFailure {
  const factory InternalServerError({required String errorMessage}) =
      _$InternalServerError;

  String get errorMessage;
  @JsonKey(ignore: true)
  $InternalServerErrorCopyWith<InternalServerError> get copyWith =>
      throw _privateConstructorUsedError;
}
