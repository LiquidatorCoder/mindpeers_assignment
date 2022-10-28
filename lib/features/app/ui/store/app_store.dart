import 'dart:async';

import 'package:mindpeers/features/app/data/controllers/app_controller.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

enum AppSettingsTypeEnum {
  LANGUAGE,
  THEME,
}

@LazySingleton()
class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final AppController appController;

  _AppStoreBase(
    this.appController,
  ) {
    init();
  }

  @observable
  Future<void> init() async {}
}
