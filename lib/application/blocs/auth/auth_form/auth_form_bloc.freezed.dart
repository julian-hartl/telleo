// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFormEventTearOff {
  const _$AuthFormEventTearOff();

  _EmailChanged emailChanged(String email) {
    return _EmailChanged(
      email,
    );
  }

  _PasswordChanged passwordChanged(String password) {
    return _PasswordChanged(
      password,
    );
  }

  _SignIn signIn() {
    return const _SignIn();
  }

  _SignInWithGoogle signInWithGoogle() {
    return const _SignInWithGoogle();
  }

  _SignUp signUp() {
    return const _SignUp();
  }
}

/// @nodoc
const $AuthFormEvent = _$AuthFormEventTearOff();

/// @nodoc
mixin _$AuthFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
    required TResult Function() signInWithGoogle,
    required TResult Function() signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignUp value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormEventCopyWith<$Res> {
  factory $AuthFormEventCopyWith(
          AuthFormEvent value, $Res Function(AuthFormEvent) then) =
      _$AuthFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthFormEventCopyWith<$Res> {
  _$AuthFormEventCopyWithImpl(this._value, this._then);

  final AuthFormEvent _value;
  // ignore: unused_field
  final $Res Function(AuthFormEvent) _then;
}

/// @nodoc
abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$EmailChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(
      _EmailChanged _value, $Res Function(_EmailChanged) _then)
      : super(_value, (v) => _then(v as _EmailChanged));

  @override
  _EmailChanged get _value => super._value as _EmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_EmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthFormEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
    required TResult Function() signInWithGoogle,
    required TResult Function() signUp,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignUp value) signUp,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements AuthFormEvent {
  const factory _EmailChanged(String email) = _$_EmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PasswordChangedCopyWith<$Res> {
  factory _$PasswordChangedCopyWith(
          _PasswordChanged value, $Res Function(_PasswordChanged) then) =
      __$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$PasswordChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$PasswordChangedCopyWith<$Res> {
  __$PasswordChangedCopyWithImpl(
      _PasswordChanged _value, $Res Function(_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _PasswordChanged));

  @override
  _PasswordChanged get _value => super._value as _PasswordChanged;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_PasswordChanged(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AuthFormEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith =>
      __$PasswordChangedCopyWithImpl<_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
    required TResult Function() signInWithGoogle,
    required TResult Function() signUp,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignUp value) signUp,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements AuthFormEvent {
  const factory _PasswordChanged(String password) = _$_PasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SignInCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) then) =
      __$SignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(_SignIn _value, $Res Function(_SignIn) _then)
      : super(_value, (v) => _then(v as _SignIn));

  @override
  _SignIn get _value => super._value as _SignIn;
}

/// @nodoc

class _$_SignIn implements _SignIn {
  const _$_SignIn();

  @override
  String toString() {
    return 'AuthFormEvent.signIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
    required TResult Function() signInWithGoogle,
    required TResult Function() signUp,
  }) {
    return signIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
  }) {
    return signIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignUp value) signUp,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements AuthFormEvent {
  const factory _SignIn() = _$_SignIn;
}

/// @nodoc
abstract class _$SignInWithGoogleCopyWith<$Res> {
  factory _$SignInWithGoogleCopyWith(
          _SignInWithGoogle value, $Res Function(_SignInWithGoogle) then) =
      __$SignInWithGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInWithGoogleCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$SignInWithGoogleCopyWith<$Res> {
  __$SignInWithGoogleCopyWithImpl(
      _SignInWithGoogle _value, $Res Function(_SignInWithGoogle) _then)
      : super(_value, (v) => _then(v as _SignInWithGoogle));

  @override
  _SignInWithGoogle get _value => super._value as _SignInWithGoogle;
}

/// @nodoc

class _$_SignInWithGoogle implements _SignInWithGoogle {
  const _$_SignInWithGoogle();

  @override
  String toString() {
    return 'AuthFormEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
    required TResult Function() signInWithGoogle,
    required TResult Function() signUp,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignUp value) signUp,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogle implements AuthFormEvent {
  const factory _SignInWithGoogle() = _$_SignInWithGoogle;
}

/// @nodoc
abstract class _$SignUpCopyWith<$Res> {
  factory _$SignUpCopyWith(_SignUp value, $Res Function(_SignUp) then) =
      __$SignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignUpCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements _$SignUpCopyWith<$Res> {
  __$SignUpCopyWithImpl(_SignUp _value, $Res Function(_SignUp) _then)
      : super(_value, (v) => _then(v as _SignUp));

  @override
  _SignUp get _value => super._value as _SignUp;
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp();

  @override
  String toString() {
    return 'AuthFormEvent.signUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signIn,
    required TResult Function() signInWithGoogle,
    required TResult Function() signUp,
  }) {
    return signUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
  }) {
    return signUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signIn,
    TResult Function()? signInWithGoogle,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignUp value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements AuthFormEvent {
  const factory _SignUp() = _$_SignUp;
}

/// @nodoc
class _$AuthFormStateTearOff {
  const _$AuthFormStateTearOff();

  _AuthState call(
      {required bool obscurePassword,
      required EmailAdress emailAdress,
      required Password password,
      required bool isSubmitting,
      required bool showErrorMessages,
      required Option<Either<AuthFailure, Unit>> authFailureOrSuccess}) {
    return _AuthState(
      obscurePassword: obscurePassword,
      emailAdress: emailAdress,
      password: password,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      authFailureOrSuccess: authFailureOrSuccess,
    );
  }
}

/// @nodoc
const $AuthFormState = _$AuthFormStateTearOff();

/// @nodoc
mixin _$AuthFormState {
  bool get obscurePassword => throw _privateConstructorUsedError;
  EmailAdress get emailAdress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  /// [authFailureOrSuccess] is none when theres neither a failure nor a success --> it contains a [AuthFailure] when something went wrong
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFormStateCopyWith<AuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormStateCopyWith<$Res> {
  factory $AuthFormStateCopyWith(
          AuthFormState value, $Res Function(AuthFormState) then) =
      _$AuthFormStateCopyWithImpl<$Res>;
  $Res call(
      {bool obscurePassword,
      EmailAdress emailAdress,
      Password password,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccess});
}

/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._value, this._then);

  final AuthFormState _value;
  // ignore: unused_field
  final $Res Function(AuthFormState) _then;

  @override
  $Res call({
    Object? obscurePassword = freezed,
    Object? emailAdress = freezed,
    Object? password = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? authFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      obscurePassword: obscurePassword == freezed
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      emailAdress: emailAdress == freezed
          ? _value.emailAdress
          : emailAdress // ignore: cast_nullable_to_non_nullable
              as EmailAdress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: authFailureOrSuccess == freezed
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool obscurePassword,
      EmailAdress emailAdress,
      Password password,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccess});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthFormStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? obscurePassword = freezed,
    Object? emailAdress = freezed,
    Object? password = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? authFailureOrSuccess = freezed,
  }) {
    return _then(_AuthState(
      obscurePassword: obscurePassword == freezed
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      emailAdress: emailAdress == freezed
          ? _value.emailAdress
          : emailAdress // ignore: cast_nullable_to_non_nullable
              as EmailAdress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: authFailureOrSuccess == freezed
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.obscurePassword,
      required this.emailAdress,
      required this.password,
      required this.isSubmitting,
      required this.showErrorMessages,
      required this.authFailureOrSuccess});

  @override
  final bool obscurePassword;
  @override
  final EmailAdress emailAdress;
  @override
  final Password password;
  @override
  final bool isSubmitting;
  @override
  final bool showErrorMessages;
  @override

  /// [authFailureOrSuccess] is none when theres neither a failure nor a success --> it contains a [AuthFailure] when something went wrong
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccess;

  @override
  String toString() {
    return 'AuthFormState(obscurePassword: $obscurePassword, emailAdress: $emailAdress, password: $password, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, authFailureOrSuccess: $authFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.emailAdress, emailAdress) ||
                other.emailAdress == emailAdress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.authFailureOrSuccess, authFailureOrSuccess) ||
                other.authFailureOrSuccess == authFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obscurePassword, emailAdress,
      password, isSubmitting, showErrorMessages, authFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthFormState {
  const factory _AuthState(
          {required bool obscurePassword,
          required EmailAdress emailAdress,
          required Password password,
          required bool isSubmitting,
          required bool showErrorMessages,
          required Option<Either<AuthFailure, Unit>> authFailureOrSuccess}) =
      _$_AuthState;

  @override
  bool get obscurePassword;
  @override
  EmailAdress get emailAdress;
  @override
  Password get password;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override

  /// [authFailureOrSuccess] is none when theres neither a failure nor a success --> it contains a [AuthFailure] when something went wrong
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
