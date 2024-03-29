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
    apiKey: 'AIzaSyCnszdMBQKfyCp-2_iH2mdRRRfY2rFYoNs',
    appId: '1:787297314554:web:d0d7894ea7562c717b0b43',
    messagingSenderId: '787297314554',
    projectId: 'emgsira',
    authDomain: 'emgsira.firebaseapp.com',
    storageBucket: 'emgsira.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNOsbLINZBJn3hQUthqIcnd-qVmYydwoo',
    appId: '1:787297314554:android:0e9bda2b3cbe43217b0b43',
    messagingSenderId: '787297314554',
    projectId: 'emgsira',
    storageBucket: 'emgsira.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_xUpMyg4V2kiQmyl3OysdVq8E4HujYOE',
    appId: '1:787297314554:ios:fe987a5dc0dabb6c7b0b43',
    messagingSenderId: '787297314554',
    projectId: 'emgsira',
    storageBucket: 'emgsira.appspot.com',
    iosBundleId: 'com.emgsira.emgsira',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_xUpMyg4V2kiQmyl3OysdVq8E4HujYOE',
    appId: '1:787297314554:ios:5371102d89a94bc97b0b43',
    messagingSenderId: '787297314554',
    projectId: 'emgsira',
    storageBucket: 'emgsira.appspot.com',
    iosBundleId: 'com.emgsira.emgsira.RunnerTests',
  );
}
