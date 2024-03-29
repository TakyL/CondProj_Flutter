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
    apiKey: 'AIzaSyBq6M-TBGITehapv8eeUngMlg0asI7Ib4Y',
    appId: '1:578900044781:web:8715e252430167068415e4',
    messagingSenderId: '578900044781',
    projectId: 'flutterbddcondprj',
    authDomain: 'flutterbddcondprj.firebaseapp.com',
    databaseURL: 'https://flutterbddcondprj-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterbddcondprj.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjdV6n1hQjMUpvLFplJIbKgtmt_-7gSL4',
    appId: '1:578900044781:android:3f40a197318031938415e4',
    messagingSenderId: '578900044781',
    projectId: 'flutterbddcondprj',
    databaseURL: 'https://flutterbddcondprj-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterbddcondprj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAbUlk1jrLC4ymT3MtJPaw_v8mmMbv9Ps',
    appId: '1:578900044781:ios:780853b430e81bc78415e4',
    messagingSenderId: '578900044781',
    projectId: 'flutterbddcondprj',
    databaseURL: 'https://flutterbddcondprj-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterbddcondprj.appspot.com',
    iosClientId: '578900044781-t4dt622qb2pqdteeikgjqg685de49k6h.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterCalendrier',
  );
}
