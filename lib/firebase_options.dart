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
    apiKey: 'AIzaSyDdRTMVQ4BppborF_n2Ty02u-g335HQ6pg',
    appId: '1:589674746794:web:17df9ae1eb5b3b639cd1d3',
    messagingSenderId: '589674746794',
    projectId: 'chatapp-a15aa',
    authDomain: 'chatapp-a15aa.firebaseapp.com',
    storageBucket: 'chatapp-a15aa.appspot.com',
    measurementId: 'G-1NXL431K9L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4da9haW3Tp908H6mOL60rUgOk8puX1P8',
    appId: '1:589674746794:android:ab6619d86d4310a59cd1d3',
    messagingSenderId: '589674746794',
    projectId: 'chatapp-a15aa',
    storageBucket: 'chatapp-a15aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaU6exnLyXcED0k4OMepVpoyBfAcs5uxE',
    appId: '1:589674746794:ios:a25413861f06962c9cd1d3',
    messagingSenderId: '589674746794',
    projectId: 'chatapp-a15aa',
    storageBucket: 'chatapp-a15aa.appspot.com',
    iosClientId: '589674746794-4s40ev7fam5et1a15n0p17va19ojlqv0.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaU6exnLyXcED0k4OMepVpoyBfAcs5uxE',
    appId: '1:589674746794:ios:d380a41049cb05359cd1d3',
    messagingSenderId: '589674746794',
    projectId: 'chatapp-a15aa',
    storageBucket: 'chatapp-a15aa.appspot.com',
    iosClientId: '589674746794-tlda6o3jpqfhhaec7u4269f878t25s18.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat.RunnerTests',
  );
}