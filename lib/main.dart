import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindpeers/common/di/di.dart' show getItInit;
import 'package:mindpeers/features/app/ui/pages/app_screen.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'common/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // register all dependecy injection
  getItInit(env: Environment.dev);

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  mainContext.onReactionError(
    (_, reactiion) {
      debugPrint(
        'A mobx reaction error occured.\n${reactiion.errorValue!.exception}',
      );
    },
  );

  runApp(
    const AppScreen(),
  );

  Isolate.current.addErrorListener(
    RawReceivePort(
      (pair) async {
        final errorAndStacktrace = pair as List;

        debugPrint(
          'An error was captured by main.Isolate.current.addErrorListener\n${errorAndStacktrace.first}',
        );
      },
    ).sendPort,
  );
}
