import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import '../utils/common/app_logger.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    AppLogger.su("Start Initialize [Firebase]");
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        AppLogger.su("Generate Firebase options for Android");
        return android;
      case TargetPlatform.iOS:
        AppLogger.su("Generate Firebase options for iOS");
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPsPu3iTJnkkujPgVOw4BKlIIs6ZkAe4M',
    appId: '1:1032370973427:android:021c2d3bbb1f0ac212a586',
    messagingSenderId: '1032370973427',
    projectId: 'forum-universal',
    storageBucket: 'forum-universal.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZaWXL-09Z2hywKDtf-bkYCMI7uGd0zFg',
    appId: '1:1032370973427:ios:98426b18ccc9377b12a586',
    messagingSenderId: '1032370973427',
    projectId: 'forum-universal',
    storageBucket: 'forum-universal.appspot.com',
    iosBundleId: 'com.example.lanLarn',
  );
}
