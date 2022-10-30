// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart'
    as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../constants/env.dart' as _i5;
import '../../features/login/data/controllers/login_controller.dart' as _i15;
import '../../features/login/data/data_sources/login_local_data_source.dart'
    as _i10;
import '../../features/login/data/data_sources/login_remote_data_source.dart'
    as _i11;
import '../../features/login/data/repositories/login_repository.dart' as _i12;
import '../../features/login/ui/store/login_store.dart' as _i16;
import '../../features/test/data/controllers/test_controller.dart' as _i17;
import '../../features/test/data/data_sources/test_remote_data_source.dart'
    as _i13;
import '../../features/test/data/repositories/test_repository.dart' as _i14;
import '../../features/test/ui/store/test_store.dart' as _i18;
import '../api_client/api_client.dart' as _i9;
import '../network/network_info.dart' as _i7;
import 'dio_di.dart' as _i20;
import 'logger_di.dart' as _i21;
import 'network_info_di.dart' as _i19;
import 'shared_preferences_di.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i3.DataConnectionChecker>(
        () => networkInfoDi.dataConnectionChecker);
    gh.lazySingleton<_i4.Dio>(() => dioDi.dio);
    gh.lazySingleton<_i5.Env>(() => _i5.Env());
    gh.lazySingleton<_i6.Logger>(() => loggerDi.logger);
    gh.lazySingleton<_i7.NetworkInfo>(
        () => _i7.NetworkInfo(get<_i3.DataConnectionChecker>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => sharedPreferencesDi.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i9.ApiClient>(() => _i9.ApiClient(get<_i4.Dio>()));
    gh.lazySingleton<_i10.LoginLocalDataSource>(
        () => _i10.LoginLocalDataSource(get<_i8.SharedPreferences>()));
    gh.lazySingleton<_i11.LoginRemoteDataSource>(
        () => _i11.LoginRemoteDataSource(get<_i9.ApiClient>()));
    gh.lazySingleton<_i12.LoginRepository>(() => _i12.LoginRepository(
          get<_i10.LoginLocalDataSource>(),
          get<_i11.LoginRemoteDataSource>(),
        ));
    gh.lazySingleton<_i13.TestRemoteDataSource>(
        () => _i13.TestRemoteDataSource(get<_i9.ApiClient>()));
    gh.lazySingleton<_i14.TestRepository>(
        () => _i14.TestRepository(get<_i13.TestRemoteDataSource>()));
    gh.lazySingleton<_i15.LoginController>(
        () => _i15.LoginController(get<_i12.LoginRepository>()));
    gh.lazySingleton<_i16.LoginStore>(
        () => _i16.LoginStore(get<_i15.LoginController>()));
    gh.lazySingleton<_i17.TestController>(
        () => _i17.TestController(get<_i14.TestRepository>()));
    gh.lazySingleton<_i18.TestStore>(
        () => _i18.TestStore(get<_i17.TestController>()));
    return this;
  }
}

class _$NetworkInfoDi extends _i19.NetworkInfoDi {}

class _$DioDi extends _i20.DioDi {}

class _$LoggerDi extends _i21.LoggerDi {}

class _$SharedPreferencesDi extends _i22.SharedPreferencesDi {}
