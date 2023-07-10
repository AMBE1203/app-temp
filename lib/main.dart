import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app_initializer.dart';
import 'shared/utils/log_utils.dart';

void main() => runZonedGuarded(_runMyApp, _reportError);

Future<void> _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  FlutterError.onError = _onError;
  runApp(ProviderScope(observers: [RiverpodLogger()], child: const MyApp()));
  AppUtils.configLoading();
}

Future<void> _onError(FlutterErrorDetails details) async {
  Log.e('zone current print error: ${details.exception}');
  Zone.current.handleUncaughtError(details.exception, details.stack!);
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');
  // report by Firebase Crashlytics here
}
