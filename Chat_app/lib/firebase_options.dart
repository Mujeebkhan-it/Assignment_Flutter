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
    apiKey: 'AIzaSyAcRQqiFPWDEDBf-cujdWw8WbKjZNumee8',
    appId: '1:690716588978:web:692f65c31a4ffdb84e42ab',
    messagingSenderId: '690716588978',
    projectId: 'octoberflutter',
    authDomain: 'octoberflutter.firebaseapp.com',
    storageBucket: 'octoberflutter.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBafLBa9aqXYBYEXrzOzcwXneak5ejpecI',
    appId: '1:690716588978:android:d04607d8db0a932d4e42ab',
    messagingSenderId: '690716588978',
    projectId: 'octoberflutter',
    storageBucket: 'octoberflutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvmNgiGER7zUAIzYvO9dGYLeOCa_LduYo',
    appId: '1:690716588978:ios:add740d901112bd94e42ab',
    messagingSenderId: '690716588978',
    projectId: 'octoberflutter',
    storageBucket: 'octoberflutter.firebasestorage.app',
    iosBundleId: 'com.example.demo1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvmNgiGER7zUAIzYvO9dGYLeOCa_LduYo',
    appId: '1:690716588978:ios:add740d901112bd94e42ab',
    messagingSenderId: '690716588978',
    projectId: 'octoberflutter',
    storageBucket: 'octoberflutter.firebasestorage.app',
    iosBundleId: 'com.example.demo1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAcRQqiFPWDEDBf-cujdWw8WbKjZNumee8',
    appId: '1:690716588978:web:572d2877ad2654104e42ab',
    messagingSenderId: '690716588978',
    projectId: 'octoberflutter',
    authDomain: 'octoberflutter.firebaseapp.com',
    storageBucket: 'octoberflutter.firebasestorage.app',
  );
}
