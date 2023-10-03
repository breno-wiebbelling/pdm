// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmPC-ONmB0F4tmwc3H1zBmWyFodmlxOnU',
    appId: '1:985603862781:web:546c91afc803d03a1b4e94',
    messagingSenderId: '985603862781',
    projectId: 'pdm3-85526',
    authDomain: 'pdm3-85526.firebaseapp.com',
    databaseURL: 'https://pdm3-85526-default-rtdb.firebaseio.com',
    storageBucket: 'pdm3-85526.appspot.com',
    measurementId: 'G-FYSEQ1KFNW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmlvAgC4_E1X2M5spgq7Qsn5JPeDboBhw',
    appId: '1:985603862781:android:699039f42b4347071b4e94',
    messagingSenderId: '985603862781',
    projectId: 'pdm3-85526',
    databaseURL: 'https://pdm3-85526-default-rtdb.firebaseio.com',
    storageBucket: 'pdm3-85526.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuf96tPLZulKDpS8vPjm3T-GcknAqqImw',
    appId: '1:985603862781:ios:d5eb07987c82ab151b4e94',
    messagingSenderId: '985603862781',
    projectId: 'pdm3-85526',
    databaseURL: 'https://pdm3-85526-default-rtdb.firebaseio.com',
    storageBucket: 'pdm3-85526.appspot.com',
    iosBundleId: 'com.example.flutterRealtimeDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAuf96tPLZulKDpS8vPjm3T-GcknAqqImw',
    appId: '1:985603862781:ios:057d3a223d8d02601b4e94',
    messagingSenderId: '985603862781',
    projectId: 'pdm3-85526',
    databaseURL: 'https://pdm3-85526-default-rtdb.firebaseio.com',
    storageBucket: 'pdm3-85526.appspot.com',
    iosBundleId: 'com.example.flutterRealtimeDatabase.RunnerTests',
  );
}