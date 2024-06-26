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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCdD_3gUBJMmAfznbJwaXvpSTb8--5HvOU',
    appId: '1:154636689959:web:8f45b4349d5706972fe402',
    messagingSenderId: '154636689959',
    projectId: 'telegram-copy-6e39e',
    authDomain: 'telegram-copy-6e39e.firebaseapp.com',
    storageBucket: 'telegram-copy-6e39e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8IlSe0sNaIFmXwbtYf_PBr6wtooQGgEg',
    appId: '1:154636689959:android:bcad595a494be6b82fe402',
    messagingSenderId: '154636689959',
    projectId: 'telegram-copy-6e39e',
    storageBucket: 'telegram-copy-6e39e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDp3wFFpe04U21fbzGR3f_22Us8-veC68A',
    appId: '1:154636689959:ios:8f86c00d60b4b7bb2fe402',
    messagingSenderId: '154636689959',
    projectId: 'telegram-copy-6e39e',
    storageBucket: 'telegram-copy-6e39e.appspot.com',
    iosBundleId: 'com.example.telegramCopy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDp3wFFpe04U21fbzGR3f_22Us8-veC68A',
    appId: '1:154636689959:ios:8f86c00d60b4b7bb2fe402',
    messagingSenderId: '154636689959',
    projectId: 'telegram-copy-6e39e',
    storageBucket: 'telegram-copy-6e39e.appspot.com',
    iosBundleId: 'com.example.telegramCopy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCdD_3gUBJMmAfznbJwaXvpSTb8--5HvOU',
    appId: '1:154636689959:web:33079a95f299d1f42fe402',
    messagingSenderId: '154636689959',
    projectId: 'telegram-copy-6e39e',
    authDomain: 'telegram-copy-6e39e.firebaseapp.com',
    storageBucket: 'telegram-copy-6e39e.appspot.com',
  );
}
