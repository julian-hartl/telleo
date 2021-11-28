// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import '../data/core/telleo_logger.dart' as _i7;
import '../data/repositories/telleo_auth_repository.dart' as _i4;
import '../domain/auth/auth_repository.dart' as _i3;
import '../domain/core/logger.dart' as _i6;
import 'modules.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthRepository>(() => _i4.TelleoAuthRepository());
  gh.lazySingleton<_i5.Logger>(() => registerModule.logger());
  gh.lazySingleton<_i6.ILogger>(
      () => _i7.TelleoLogger(logger: get<_i5.Logger>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
