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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBKPO7HMGMeE5KURjhafGt6W1i-xbOVk8s',
    appId: '1:410922101024:web:8e7763e3c0891ecf580f45',
    messagingSenderId: '410922101024',
    projectId: 'fir-cruddemo-9c66e',
    authDomain: 'fir-cruddemo-9c66e.firebaseapp.com',
    storageBucket: 'fir-cruddemo-9c66e.appspot.com',
    measurementId: 'G-75ZTJDKS5V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnPzz6VqGqj11AeTmfIvZN_6q_kpLn7rw',
    appId: '1:410922101024:android:bf847f9f2f6b99c3580f45',
    messagingSenderId: '410922101024',
    projectId: 'fir-cruddemo-9c66e',
    storageBucket: 'fir-cruddemo-9c66e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7xfxOQ9IuLniq2wVyp9do7TTNlmsl9QY',
    appId: '1:410922101024:ios:be0d0840083e03a7580f45',
    messagingSenderId: '410922101024',
    projectId: 'fir-cruddemo-9c66e',
    storageBucket: 'fir-cruddemo-9c66e.appspot.com',
    iosClientId: '410922101024-5rj2col799454al6vrps0hdtm1g940og.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrudDemo',
  );
}
