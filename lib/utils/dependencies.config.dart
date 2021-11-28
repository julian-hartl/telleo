// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import '../application/blocs/auth/auth_bloc.dart' as _i10;
import '../data/core/telleo_logger.dart' as _i14;
import '../data/repositories/telleo_auth_repository.dart' as _i12;
import '../data/repositories/telleo_user_repository.dart' as _i7;
import '../data/services/telleo_api_service.dart' as _i4;
import '../data/states/user_state.dart' as _i9;
import '../domain/auth/auth_repository.dart' as _i11;
import '../domain/core/repositories/user_repository.dart' as _i6;
import '../domain/core/services/api_service.dart' as _i3;
import '../domain/core/services/logger.dart' as _i13;
import '../domain/states/user_state.dart' as _i8;
import 'modules.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.ApiService>(() => _i4.TelleoApiService());
  gh.lazySingleton<_i5.Logger>(() => registerModule.logger());
  gh.lazySingleton<_i6.UserRepository>(() => _i7.TelleoUserRepository());
  gh.lazySingleton<_i8.UserState>(() => _i9.TelleoUserState());
  gh.lazySingleton<_i10.AuthBloc>(
      () => _i10.AuthBloc(get<_i6.UserRepository>(), get<_i8.UserState>()));
  gh.lazySingleton<_i11.AuthRepository>(() =>
      _i12.TelleoAuthRepository(get<_i8.UserState>(), get<_i3.ApiService>()));
  gh.lazySingleton<_i13.ILogger>(
      () => _i14.TelleoLogger(logger: get<_i5.Logger>()));
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
