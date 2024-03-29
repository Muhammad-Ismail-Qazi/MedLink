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
    apiKey: 'AIzaSyBG9K75vUF57cyfy4x6maWg9CF5L_b40D4',
    appId: '1:154587859413:web:e65969d322c16abd44d55c',
    messagingSenderId: '154587859413',
    projectId: 'medlink-e62ba',
    authDomain: 'medlink-e62ba.firebaseapp.com',
    storageBucket: 'medlink-e62ba.appspot.com',
    measurementId: 'G-4QRNEKYX72',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvJXr6LI-vhicgZZwMsUfnOaofnGaemNo',
    appId: '1:154587859413:android:c71ed8547b5173db44d55c',
    messagingSenderId: '154587859413',
    projectId: 'medlink-e62ba',
    storageBucket: 'medlink-e62ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqWSE1x9XhJGVn7kYUvUXohCGAT01lqnE',
    appId: '1:154587859413:ios:05639e24dca5d41e44d55c',
    messagingSenderId: '154587859413',
    projectId: 'medlink-e62ba',
    storageBucket: 'medlink-e62ba.appspot.com',
    iosBundleId: 'com.example.medlink',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqWSE1x9XhJGVn7kYUvUXohCGAT01lqnE',
    appId: '1:154587859413:ios:4d97fc818225d99a44d55c',
    messagingSenderId: '154587859413',
    projectId: 'medlink-e62ba',
    storageBucket: 'medlink-e62ba.appspot.com',
    iosBundleId: 'com.example.medlink.RunnerTests',
  );
}
