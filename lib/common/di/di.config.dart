// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart'
    as _i5;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../constants/env.dart' as _i7;
import '../../features/app/data/controllers/app_controller.dart' as _i12;
import '../../features/app/data/data_sources/app_local_data_source.dart' as _i3;
import '../../features/app/data/repositories/app_repository.dart' as _i4;
import '../../features/app/ui/store/app_store.dart' as _i13;
import '../../features/login/data/controllers/login_controller.dart' as _i18;
import '../../features/login/data/data_sources/login_local_data_source.dart'
    as _i15;
import '../../features/login/data/data_sources/login_remote_data_source.dart'
    as _i16;
import '../../features/login/data/repositories/login_repository.dart' as _i17;
import '../../features/login/ui/store/login_store.dart' as _i19;
import '../../utils/log/log_it.dart' as _i14;
import '../api_client/api_client.dart' as _i11;
import '../network/network_info.dart' as _i9;
import 'dio_di.dart' as _i21;
import 'logger_di.dart' as _i22;
import 'network_info_di.dart' as _i20;
import 'shared_preferences_di.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkInfoDi = _$NetworkInfoDi();
    final dioDi = _$DioDi();
    final loggerDi = _$LoggerDi();
    final sharedPreferencesDi = _$SharedPreferencesDi();
    gh.lazySingleton<_i3.AppLocalDataSource>(() => _i3.AppLocalDataSource());
    gh.lazySingleton<_i4.AppRepository>(
        () => _i4.AppRepository(get<_i3.AppLocalDataSource>()));
    gh.lazySingleton<_i5.DataConnectionChecker>(
        () => networkInfoDi.dataConnectionChecker);
    gh.lazySingleton<_i6.Dio>(() => dioDi.dio);
    gh.lazySingleton<_i7.Env>(() => _i7.Env());
    gh.lazySingleton<_i8.Logger>(() => loggerDi.logger);
    gh.lazySingleton<_i9.NetworkInfo>(
        () => _i9.NetworkInfo(get<_i5.DataConnectionChecker>()));
    await gh.factoryAsync<_i10.SharedPreferences>(
      () => sharedPreferencesDi.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i11.ApiClient>(() => _i11.ApiClient(get<_i6.Dio>()));
    gh.lazySingleton<_i12.AppController>(
        () => _i12.AppController(get<_i4.AppRepository>()));
    gh.lazySingleton<_i13.AppStore>(
        () => _i13.AppStore(get<_i12.AppController>()));
    gh.lazySingleton<_i14.LogIt>(() => _i14.LogIt(get<_i8.Logger>()));
    gh.lazySingleton<_i15.LoginLocalDataSource>(
        () => _i15.LoginLocalDataSource(get<_i10.SharedPreferences>()));
    gh.lazySingleton<_i16.LoginRemoteDataSource>(
        () => _i16.LoginRemoteDataSource(get<_i11.ApiClient>()));
    gh.lazySingleton<_i17.LoginRepository>(() => _i17.LoginRepository(
          get<_i15.LoginLocalDataSource>(),
          get<_i16.LoginRemoteDataSource>(),
          get<_i9.NetworkInfo>(),
        ));
    gh.lazySingleton<_i18.LoginController>(
        () => _i18.LoginController(get<_i17.LoginRepository>()));
    gh.lazySingleton<_i19.LoginStore>(
        () => _i19.LoginStore(get<_i18.LoginController>()));
    return this;
  }
}

class _$NetworkInfoDi extends _i20.NetworkInfoDi {}

class _$DioDi extends _i21.DioDi {}

class _$LoggerDi extends _i22.LoggerDi {}

class _$SharedPreferencesDi extends _i23.SharedPreferencesDi {}
