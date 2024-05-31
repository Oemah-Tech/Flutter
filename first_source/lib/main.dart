import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/config/firebase_options.dart';
import 'src/utils/common/com_logger.dart';
import 'src/utils/common/com_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    ComLogger.su("Start Application - LanLan");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await ComPrefs.setInit(true);

    recordCrashlytics();
    runApp(const App());
  } catch (error) {
    FirebaseCrashlytics.instance.recordError(error, StackTrace.current);
  }
}

void recordCrashlytics() {
  ComLogger.su("Record [Crashlytics]");
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
