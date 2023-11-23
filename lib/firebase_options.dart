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
    apiKey: 'AIzaSyAfP6jx6PmUeqL4FX8regVxttPHIFKtDRQ',
    appId: '1:698235063823:web:dc7f526fe9b17ede211d7a',
    messagingSenderId: '698235063823',
    projectId: 'pruebaespaciodigital',
    authDomain: 'pruebaespaciodigital.firebaseapp.com',
    storageBucket: 'pruebaespaciodigital.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAPaO4oFQz9hD4Hk6nejOrgNiAHkleYrI',
    appId: '1:698235063823:android:d08dc04b76faeb5d211d7a',
    messagingSenderId: '698235063823',
    projectId: 'pruebaespaciodigital',
    storageBucket: 'pruebaespaciodigital.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPsgGy82gxCUrx-Ee3j17Vi2NvTO4-MQI',
    appId: '1:698235063823:ios:980bc94acdc06bb5211d7a',
    messagingSenderId: '698235063823',
    projectId: 'pruebaespaciodigital',
    storageBucket: 'pruebaespaciodigital.appspot.com',
    iosBundleId: 'com.manuelteran.pruebaEspacioDigital',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPsgGy82gxCUrx-Ee3j17Vi2NvTO4-MQI',
    appId: '1:698235063823:ios:1edc215c7d101cb8211d7a',
    messagingSenderId: '698235063823',
    projectId: 'pruebaespaciodigital',
    storageBucket: 'pruebaespaciodigital.appspot.com',
    iosBundleId: 'com.example.pruebaEspacioDigital.RunnerTests',
  );
}