import 'dart:async';

import 'package:mindpeers/features/app/data/controllers/app_controller.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

enum AppSettingsTypeEnum {
  language,
  theme,
}

@LazySingleton()
class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  final AppController appController;

  AppStoreBase(
    this.appController,
  ) {
    init();
  }

  @observable
  Future<void> init() async {}
}
