import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:lan_larn/src/utils/common/app_logger.dart';

import 'config/firebase_options.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    AppLogger.su("Start Application - LanLan");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    recordCrashlytics();
    runApp(const App());
  } catch (error) {
    FirebaseCrashlytics.instance.recordError(error, StackTrace.current);
  }
}

void recordCrashlytics() {
  AppLogger.su("Record [Crashlytics]");
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
