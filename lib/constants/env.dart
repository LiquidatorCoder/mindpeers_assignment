import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:mindpeers/common/di/di.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Env {
  static const bool isRelease = foundation.kReleaseMode;

  static const bool isDebug = !foundation.kReleaseMode;

  static final bool isTest = Platform.environment.containsKey('FLUTTER_TEST');

  EnvData get config => isRelease ? prod : dev;

  static final EnvData dev = EnvData(
    debug: true,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: true,
    apiBaseUrl: '',
  );

  static final EnvData prod = EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
    apiBaseUrl: '',
  );
}

class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;

  EnvData({
    required this.debug,
    required this.debugShowCheckedModeBanner,
    required this.debugShowMaterialGrid,
    required this.debugApiClient,
    required this.apiBaseUrl,
  });
}

final Env env = getIt<Env>();
