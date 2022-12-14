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
    apiKey: 'AIzaSyC-mXpFsj-8xv0_emGOjGeoJHj-i6Ub_6A',
    appId: '1:93541010773:web:b3427b5c1e8c5fa74eb3dc',
    messagingSenderId: '93541010773',
    projectId: 'vitals-b3bbd',
    authDomain: 'vitals-b3bbd.firebaseapp.com',
    storageBucket: 'vitals-b3bbd.appspot.com',
    measurementId: 'G-BJNS7HRP3Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_9NzOQ3GHAx08NcoN_BRnXTiSABcs2OE',
    appId: '1:93541010773:android:121cdb090e62ea974eb3dc',
    messagingSenderId: '93541010773',
    projectId: 'vitals-b3bbd',
    storageBucket: 'vitals-b3bbd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5osm1mxer9Cf041vciqKPsrPcXKUxC2E',
    appId: '1:93541010773:ios:2d785db772bb40c94eb3dc',
    messagingSenderId: '93541010773',
    projectId: 'vitals-b3bbd',
    storageBucket: 'vitals-b3bbd.appspot.com',
    iosClientId: '93541010773-ce1bpegn1sludtalj33h8kt3v9cpv94b.apps.googleusercontent.com',
    iosBundleId: 'com.example.vitals',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5osm1mxer9Cf041vciqKPsrPcXKUxC2E',
    appId: '1:93541010773:ios:2d785db772bb40c94eb3dc',
    messagingSenderId: '93541010773',
    projectId: 'vitals-b3bbd',
    storageBucket: 'vitals-b3bbd.appspot.com',
    iosClientId: '93541010773-ce1bpegn1sludtalj33h8kt3v9cpv94b.apps.googleusercontent.com',
    iosBundleId: 'com.example.vitals',
  );
}
