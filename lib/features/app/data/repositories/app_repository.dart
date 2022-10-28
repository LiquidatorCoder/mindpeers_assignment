import 'package:mindpeers/features/app/data/data_sources/app_local_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppRepository {
  final AppLocalDataSource _appLocalDataSource;

  AppRepository(
    this._appLocalDataSource,
  );
}
