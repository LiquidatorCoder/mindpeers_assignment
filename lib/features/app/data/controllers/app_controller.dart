import 'package:mindpeers/features/app/data/repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppController {
  final AppRepository _appRepository;

  AppController(this._appRepository);
}
