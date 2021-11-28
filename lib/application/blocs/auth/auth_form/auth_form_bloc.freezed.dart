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

  AuthEmailChanged emailChanged(String email) {
    return AuthEmailChanged(
      email,
    );
  }

  AuthPasswordChanged passwordChanged(String password) {
    return AuthPasswordChanged(
      password,
    );
  }

  AuthSignIn signIn() {
    return const AuthSignIn();
  }

  AuthSignInWithGoogle signInWithGoogle() {
    return const AuthSignInWithGoogle();
  }

  AuthSignUp signUp() {
    return const AuthSignUp();
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
    required TResult Function(AuthEmailChanged value) emailChanged,
    required TResult Function(AuthPasswordChanged value) passwordChanged,
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignInWithGoogle value) signInWithGoogle,
    required TResult Function(AuthSignUp value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
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
abstract class $AuthEmailChangedCopyWith<$Res> {
  factory $AuthEmailChangedCopyWith(
          AuthEmailChanged value, $Res Function(AuthEmailChanged) then) =
      _$AuthEmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$AuthEmailChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthEmailChangedCopyWith<$Res> {
  _$AuthEmailChangedCopyWithImpl(
      AuthEmailChanged _value, $Res Function(AuthEmailChanged) _then)
      : super(_value, (v) => _then(v as AuthEmailChanged));

  @override
  AuthEmailChanged get _value => super._value as AuthEmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(AuthEmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthEmailChanged implements AuthEmailChanged {
  const _$AuthEmailChanged(this.email);

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
            other is AuthEmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  $AuthEmailChangedCopyWith<AuthEmailChanged> get copyWith =>
      _$AuthEmailChangedCopyWithImpl<AuthEmailChanged>(this, _$identity);

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
    required TResult Function(AuthEmailChanged value) emailChanged,
    required TResult Function(AuthPasswordChanged value) passwordChanged,
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignInWithGoogle value) signInWithGoogle,
    required TResult Function(AuthSignUp value) signUp,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class AuthEmailChanged implements AuthFormEvent {
  const factory AuthEmailChanged(String email) = _$AuthEmailChanged;

  String get email;
  @JsonKey(ignore: true)
  $AuthEmailChangedCopyWith<AuthEmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPasswordChangedCopyWith<$Res> {
  factory $AuthPasswordChangedCopyWith(
          AuthPasswordChanged value, $Res Function(AuthPasswordChanged) then) =
      _$AuthPasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$AuthPasswordChangedCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthPasswordChangedCopyWith<$Res> {
  _$AuthPasswordChangedCopyWithImpl(
      AuthPasswordChanged _value, $Res Function(AuthPasswordChanged) _then)
      : super(_value, (v) => _then(v as AuthPasswordChanged));

  @override
  AuthPasswordChanged get _value => super._value as AuthPasswordChanged;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(AuthPasswordChanged(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthPasswordChanged implements AuthPasswordChanged {
  const _$AuthPasswordChanged(this.password);

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
            other is AuthPasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  $AuthPasswordChangedCopyWith<AuthPasswordChanged> get copyWith =>
      _$AuthPasswordChangedCopyWithImpl<AuthPasswordChanged>(this, _$identity);

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
    required TResult Function(AuthEmailChanged value) emailChanged,
    required TResult Function(AuthPasswordChanged value) passwordChanged,
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignInWithGoogle value) signInWithGoogle,
    required TResult Function(AuthSignUp value) signUp,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class AuthPasswordChanged implements AuthFormEvent {
  const factory AuthPasswordChanged(String password) = _$AuthPasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  $AuthPasswordChangedCopyWith<AuthPasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSignInCopyWith<$Res> {
  factory $AuthSignInCopyWith(
          AuthSignIn value, $Res Function(AuthSignIn) then) =
      _$AuthSignInCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthSignInCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthSignInCopyWith<$Res> {
  _$AuthSignInCopyWithImpl(AuthSignIn _value, $Res Function(AuthSignIn) _then)
      : super(_value, (v) => _then(v as AuthSignIn));

  @override
  AuthSignIn get _value => super._value as AuthSignIn;
}

/// @nodoc

class _$AuthSignIn implements AuthSignIn {
  const _$AuthSignIn();

  @override
  String toString() {
    return 'AuthFormEvent.signIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSignIn);
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
    required TResult Function(AuthEmailChanged value) emailChanged,
    required TResult Function(AuthPasswordChanged value) passwordChanged,
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignInWithGoogle value) signInWithGoogle,
    required TResult Function(AuthSignUp value) signUp,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class AuthSignIn implements AuthFormEvent {
  const factory AuthSignIn() = _$AuthSignIn;
}

/// @nodoc
abstract class $AuthSignInWithGoogleCopyWith<$Res> {
  factory $AuthSignInWithGoogleCopyWith(AuthSignInWithGoogle value,
          $Res Function(AuthSignInWithGoogle) then) =
      _$AuthSignInWithGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthSignInWithGoogleCopyWithImpl<$Res>
    extends _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthSignInWithGoogleCopyWith<$Res> {
  _$AuthSignInWithGoogleCopyWithImpl(
      AuthSignInWithGoogle _value, $Res Function(AuthSignInWithGoogle) _then)
      : super(_value, (v) => _then(v as AuthSignInWithGoogle));

  @override
  AuthSignInWithGoogle get _value => super._value as AuthSignInWithGoogle;
}

/// @nodoc

class _$AuthSignInWithGoogle implements AuthSignInWithGoogle {
  const _$AuthSignInWithGoogle();

  @override
  String toString() {
    return 'AuthFormEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSignInWithGoogle);
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
    required TResult Function(AuthEmailChanged value) emailChanged,
    required TResult Function(AuthPasswordChanged value) passwordChanged,
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignInWithGoogle value) signInWithGoogle,
    required TResult Function(AuthSignUp value) signUp,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class AuthSignInWithGoogle implements AuthFormEvent {
  const factory AuthSignInWithGoogle() = _$AuthSignInWithGoogle;
}

/// @nodoc
abstract class $AuthSignUpCopyWith<$Res> {
  factory $AuthSignUpCopyWith(
          AuthSignUp value, $Res Function(AuthSignUp) then) =
      _$AuthSignUpCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthSignUpCopyWithImpl<$Res> extends _$AuthFormEventCopyWithImpl<$Res>
    implements $AuthSignUpCopyWith<$Res> {
  _$AuthSignUpCopyWithImpl(AuthSignUp _value, $Res Function(AuthSignUp) _then)
      : super(_value, (v) => _then(v as AuthSignUp));

  @override
  AuthSignUp get _value => super._value as AuthSignUp;
}

/// @nodoc

class _$AuthSignUp implements AuthSignUp {
  const _$AuthSignUp();

  @override
  String toString() {
    return 'AuthFormEvent.signUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSignUp);
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
    required TResult Function(AuthEmailChanged value) emailChanged,
    required TResult Function(AuthPasswordChanged value) passwordChanged,
    required TResult Function(AuthSignIn value) signIn,
    required TResult Function(AuthSignInWithGoogle value) signInWithGoogle,
    required TResult Function(AuthSignUp value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEmailChanged value)? emailChanged,
    TResult Function(AuthPasswordChanged value)? passwordChanged,
    TResult Function(AuthSignIn value)? signIn,
    TResult Function(AuthSignInWithGoogle value)? signInWithGoogle,
    TResult Function(AuthSignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class AuthSignUp implements AuthFormEvent {
  const factory AuthSignUp() = _$AuthSignUp;
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
