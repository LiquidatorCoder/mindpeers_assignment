import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:mindpeers/common/di/di.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Env {
  static const bool isRelease = foundation.kReleaseMode;

  static const bool isDebug = !foundation.kReleaseMode;

  static final bool isTest = Platform.environment.containsKey('FLUTTER_TEST');

  _EnvData get config => isRelease ? prod : dev;

  static final _EnvData dev = _EnvData(
    debug: true,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: true,
  );

  static final _EnvData prod = _EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
  );
}

class _EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;

  _EnvData({
    required this.debug,
    required this.debugShowCheckedModeBanner,
    required this.debugShowMaterialGrid,
    required this.debugApiClient,
  });
}

final Env env = getIt<Env>();
