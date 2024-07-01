// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAzwsA1fiGGBf6J0erk2fu-9ZT0jb127T8',
    appId: '1:991034804524:android:0476d2dd250df3d9ed0489',
    messagingSenderId: '991034804524',
    projectId: 'bloc-clean-architecture-911ca',
    storageBucket: 'bloc-clean-architecture-911ca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAq5lsKCpZu3ktRd8zXyfCSD1xQ7LGM5Pw',
    appId: '1:991034804524:ios:3704be3051ae04caed0489',
    messagingSenderId: '991034804524',
    projectId: 'bloc-clean-architecture-911ca',
    storageBucket: 'bloc-clean-architecture-911ca.appspot.com',
    iosBundleId: 'com.example.blocCleanArchitectureTemplate',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCZvJMaiX6cAToWvMB9zhiZ4Kff2DiTlUc",
    authDomain: "bloc-clean-architecture-911ca.firebaseapp.com",
    projectId: "bloc-clean-architecture-911ca",
    storageBucket: "bloc-clean-architecture-911ca.appspot.com",
    messagingSenderId: "991034804524",
    appId: "1:991034804524:web:b885439764074422ed0489",
    measurementId: "G-M1YEKZJWBB",
  );
}
