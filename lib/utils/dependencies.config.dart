// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;

import '../application/blocs/auth/auth_bloc.dart' as _i14;
import '../application/blocs/chats/chats_bloc.dart' as _i17;
import '../data/core/telleo_logger.dart' as _i19;
import '../data/repositories/telleo_auth_repository.dart' as _i16;
import '../data/repositories/telleo_chats_repository.dart' as _i8;
import '../data/repositories/telleo_user_repository.dart' as _i11;
import '../data/services/telleo_api_service.dart' as _i4;
import '../data/states/chats_data_state.dart' as _i6;
import '../data/states/user_state.dart' as _i13;
import '../domain/auth/auth_repository.dart' as _i15;
import '../domain/chats/chats_data_state.dart' as _i5;
import '../domain/chats/chats_repository.dart' as _i7;
import '../domain/core/services/api_service/api_service.dart' as _i3;
import '../domain/core/services/logger.dart' as _i18;
import '../domain/user/user_repository.dart' as _i10;
import '../domain/user/user_state.dart' as _i12;
import 'modules.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.ApiService>(() => _i4.TelleoApiService());
  gh.lazySingleton<_i5.ChatsDataState>(() => _i6.TelleoChatsState());
  gh.lazySingleton<_i7.ChatsRepository>(() => _i8.TelleoChatsRepository());
  gh.lazySingleton<_i9.Logger>(() => registerModule.logger());
  gh.lazySingleton<_i10.UserRepository>(() => _i11.TelleoUserRepository());
  gh.lazySingleton<_i12.UserState>(() => _i13.TelleoUserState());
  gh.lazySingleton<_i14.AuthBloc>(
      () => _i14.AuthBloc(get<_i10.UserRepository>(), get<_i12.UserState>()));
  gh.lazySingleton<_i15.AuthRepository>(() =>
      _i16.TelleoAuthRepository(get<_i12.UserState>(), get<_i3.ApiService>()));
  gh.lazySingleton<_i17.ChatsBloc>(() =>
      _i17.ChatsBloc(get<_i5.ChatsDataState>(), get<_i7.ChatsRepository>()));
  gh.lazySingleton<_i18.ILogger>(
      () => _i19.TelleoLogger(logger: get<_i9.Logger>()));
  return get;
}

class _$RegisterModule extends _i20.RegisterModule {}
