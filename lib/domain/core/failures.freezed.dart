// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmailFailure<T> emailAdress<T>({required String failedValue}) {
    return InvalidEmailFailure<T>(
      failedValue: failedValue,
    );
  }

  ShortPasswordFailure<T> shortPassword<T>({required String failedValue}) {
    return ShortPasswordFailure<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emailAdress,
    required TResult Function(String failedValue) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emailAdress,
    TResult Function(String failedValue)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emailAdress,
    TResult Function(String failedValue)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailFailure<T> value) emailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? emailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? emailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

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
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailFailureCopyWith(InvalidEmailFailure<T> value,
          $Res Function(InvalidEmailFailure<T>) then) =
      _$InvalidEmailFailureCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidEmailFailureCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
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
    return 'ValueFailure<$T>.emailAdress(failedValue: $failedValue)';
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
    required TResult Function(String failedValue) emailAdress,
    required TResult Function(String failedValue) shortPassword,
  }) {
    return emailAdress(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emailAdress,
    TResult Function(String failedValue)? shortPassword,
  }) {
    return emailAdress?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emailAdress,
    TResult Function(String failedValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (emailAdress != null) {
      return emailAdress(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmailFailure<T> value) emailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
  }) {
    return emailAdress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? emailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
  }) {
    return emailAdress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? emailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (emailAdress != null) {
      return emailAdress(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailFailure<T> implements ValueFailure<T> {
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
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ShortPasswordFailureCopyWith(ShortPasswordFailure<T> value,
          $Res Function(ShortPasswordFailure<T>) then) =
      _$ShortPasswordFailureCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$ShortPasswordFailureCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
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
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
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
    required TResult Function(String failedValue) emailAdress,
    required TResult Function(String failedValue) shortPassword,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emailAdress,
    TResult Function(String failedValue)? shortPassword,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emailAdress,
    TResult Function(String failedValue)? shortPassword,
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
    required TResult Function(InvalidEmailFailure<T> value) emailAdress,
    required TResult Function(ShortPasswordFailure<T> value) shortPassword,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? emailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmailFailure<T> value)? emailAdress,
    TResult Function(ShortPasswordFailure<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPasswordFailure<T> implements ValueFailure<T> {
  const factory ShortPasswordFailure({required String failedValue}) =
      _$ShortPasswordFailure<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $ShortPasswordFailureCopyWith<T, ShortPasswordFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
