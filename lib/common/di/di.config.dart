// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;

import '../../constants/env.dart' as _i5;
import '../../features/app/data/controllers/app_controller.dart' as _i7;
import '../../features/app/data/data_sources/app_local_data_source.dart' as _i3;
import '../../features/app/data/repositories/app_repository.dart' as _i4;
import '../../features/app/ui/store/app_store.dart' as _i8;
import '../../utils/log/log_it.dart' as _i9;
import 'logger_di.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerDi = _$LoggerDi();
    gh.lazySingleton<_i3.AppLocalDataSource>(() => _i3.AppLocalDataSource());
    gh.lazySingleton<_i4.AppRepository>(
        () => _i4.AppRepository(get<_i3.AppLocalDataSource>()));
    gh.lazySingleton<_i5.Env>(() => _i5.Env());
    gh.lazySingleton<_i6.Logger>(() => loggerDi.logger);
    gh.lazySingleton<_i7.AppController>(
        () => _i7.AppController(get<_i4.AppRepository>()));
    gh.lazySingleton<_i8.AppStore>(
        () => _i8.AppStore(get<_i7.AppController>()));
    gh.lazySingleton<_i9.LogIt>(() => _i9.LogIt(get<_i6.Logger>()));
    return this;
  }
}

class _$LoggerDi extends _i10.LoggerDi {}
