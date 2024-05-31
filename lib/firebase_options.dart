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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAuCUNeZbxrpQ_7rIrPB4f7uI_qRq6dx0c',
    appId: '1:241027612374:web:18a1770ed70ebef1255377',
    messagingSenderId: '241027612374',
    projectId: 'deepfacedemo-2c7d4',
    authDomain: 'deepfacedemo-2c7d4.firebaseapp.com',
    storageBucket: 'deepfacedemo-2c7d4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXdt5EtWZ3rKq-1viaTpA8wgp9D78rIVI',
    appId: '1:241027612374:android:6127222ed68b783c255377',
    messagingSenderId: '241027612374',
    projectId: 'deepfacedemo-2c7d4',
    storageBucket: 'deepfacedemo-2c7d4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwfY82dhQzlxN8_nlGcq0ivV8_PF5xvFw',
    appId: '1:241027612374:ios:d28efe555b2038c9255377',
    messagingSenderId: '241027612374',
    projectId: 'deepfacedemo-2c7d4',
    storageBucket: 'deepfacedemo-2c7d4.appspot.com',
    iosBundleId: 'dev.mmuhamadiev.deepfacetest.deepfaceTest',
  );
}
