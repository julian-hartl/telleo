// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthValueFailureTearOff {
  const _$AuthValueFailureTearOff();

  InvalidEmailFailure<T> invalidEmailAdress<T>({required String failedValue}) {
    return InvalidEmailFailure<T>(
      failedValue: failedValue,
    );
  }

  ShortPasswordFailure<T> shortPassword<T>({required String failedValue}) {
    return ShortPasswordFailure<T>(
      failedValue: failedValue,
    );
  }

  ShortNameFailure<T> shortName<T>({required String failedValue}) {
    return ShortNameFailure<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $AuthValueFailure = _$AuthValueFailureTearOff();

/// @nodoc
mixin _$AuthValueFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmailAdress,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) shortName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailFailure<T> value) invalidEmailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
    required TResult Function(ShortNameFailure<T> value) shortName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthValueFailureCopyWith<T, AuthValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthValueFailureCopyWith<T, $Res> {
  factory $AuthValueFailureCopyWith(
          AuthValueFailure<T> value, $Res Function(AuthValueFailure<T>) then) =
      _$AuthValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$AuthValueFailureCopyWithImpl<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  _$AuthValueFailureCopyWithImpl(this._value, this._then);

  final AuthValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(AuthValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $InvalidEmailFailureCopyWith<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailFailureCopyWith(InvalidEmailFailure<T> value,
          $Res Function(InvalidEmailFailure<T>) then) =
      _$InvalidEmailFailureCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidEmailFailureCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailFailureCopyWith<T, $Res> {
  _$InvalidEmailFailureCopyWithImpl(InvalidEmailFailure<T> _value,
      $Res Function(InvalidEmailFailure<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmailFailure<T>));

  @override
  InvalidEmailFailure<T> get _value => super._value as InvalidEmailFailure<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidEmailFailure<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidEmailFailure<T> implements InvalidEmailFailure<T> {
  const _$InvalidEmailFailure({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.invalidEmailAdress(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmailFailure<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidEmailFailureCopyWith<T, InvalidEmailFailure<T>> get copyWith =>
      _$InvalidEmailFailureCopyWithImpl<T, InvalidEmailFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmailAdress,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) shortName,
  }) {
    return invalidEmailAdress(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
  }) {
    return invalidEmailAdress?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
    required TResult orElse(),
  }) {
    if (invalidEmailAdress != null) {
      return invalidEmailAdress(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailFailure<T> value) invalidEmailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
    required TResult Function(ShortNameFailure<T> value) shortName,
  }) {
    return invalidEmailAdress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
  }) {
    return invalidEmailAdress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
    required TResult orElse(),
  }) {
    if (invalidEmailAdress != null) {
      return invalidEmailAdress(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailFailure<T> implements AuthValueFailure<T> {
  const factory InvalidEmailFailure({required String failedValue}) =
      _$InvalidEmailFailure<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidEmailFailureCopyWith<T, InvalidEmailFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortPasswordFailureCopyWith<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  factory $ShortPasswordFailureCopyWith(ShortPasswordFailure<T> value,
          $Res Function(ShortPasswordFailure<T>) then) =
      _$ShortPasswordFailureCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$ShortPasswordFailureCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res>
    implements $ShortPasswordFailureCopyWith<T, $Res> {
  _$ShortPasswordFailureCopyWithImpl(ShortPasswordFailure<T> _value,
      $Res Function(ShortPasswordFailure<T>) _then)
      : super(_value, (v) => _then(v as ShortPasswordFailure<T>));

  @override
  ShortPasswordFailure<T> get _value => super._value as ShortPasswordFailure<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ShortPasswordFailure<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShortPasswordFailure<T> implements ShortPasswordFailure<T> {
  const _$ShortPasswordFailure({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShortPasswordFailure<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  $ShortPasswordFailureCopyWith<T, ShortPasswordFailure<T>> get copyWith =>
      _$ShortPasswordFailureCopyWithImpl<T, ShortPasswordFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmailAdress,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) shortName,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailFailure<T> value) invalidEmailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
    required TResult Function(ShortNameFailure<T> value) shortName,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPasswordFailure<T> implements AuthValueFailure<T> {
  const factory ShortPasswordFailure({required String failedValue}) =
      _$ShortPasswordFailure<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $ShortPasswordFailureCopyWith<T, ShortPasswordFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortNameFailureCopyWith<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  factory $ShortNameFailureCopyWith(
          ShortNameFailure<T> value, $Res Function(ShortNameFailure<T>) then) =
      _$ShortNameFailureCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$ShortNameFailureCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res>
    implements $ShortNameFailureCopyWith<T, $Res> {
  _$ShortNameFailureCopyWithImpl(
      ShortNameFailure<T> _value, $Res Function(ShortNameFailure<T>) _then)
      : super(_value, (v) => _then(v as ShortNameFailure<T>));

  @override
  ShortNameFailure<T> get _value => super._value as ShortNameFailure<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ShortNameFailure<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShortNameFailure<T> implements ShortNameFailure<T> {
  const _$ShortNameFailure({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.shortName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShortNameFailure<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  $ShortNameFailureCopyWith<T, ShortNameFailure<T>> get copyWith =>
      _$ShortNameFailureCopyWithImpl<T, ShortNameFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmailAdress,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function(String failedValue) shortName,
  }) {
    return shortName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
  }) {
    return shortName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmailAdress,
    TResult Function(String failedValue)? shortPassword,
    TResult Function(String failedValue)? shortName,
    required TResult orElse(),
  }) {
    if (shortName != null) {
      return shortName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailFailure<T> value) invalidEmailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
    required TResult Function(ShortNameFailure<T> value) shortName,
  }) {
    return shortName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
  }) {
    return shortName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? invalidEmailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    TResult Function(ShortNameFailure<T> value)? shortName,
    required TResult orElse(),
  }) {
    if (shortName != null) {
      return shortName(this);
    }
    return orElse();
  }
}

abstract class ShortNameFailure<T> implements AuthValueFailure<T> {
  const factory ShortNameFailure({required String failedValue}) =
      _$ShortNameFailure<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $ShortNameFailureCopyWith<T, ShortNameFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
