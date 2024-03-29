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
    apiKey: 'AIzaSyDrFz_FnrxhVS2CsaG5ocw9YErQ_wW0RQA',
    appId: '1:261961189411:web:90cc01c51f69a48dd28996',
    messagingSenderId: '261961189411',
    projectId: 'e-mart-afc02',
    authDomain: 'e-mart-afc02.firebaseapp.com',
    storageBucket: 'e-mart-afc02.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmYWcqZcjposIAmarlNTjA4G8m4r6j3A8',
    appId: '1:261961189411:android:c85298ce7542ae68d28996',
    messagingSenderId: '261961189411',
    projectId: 'e-mart-afc02',
    storageBucket: 'e-mart-afc02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB83glYXSPdIpUENov0_yvCXKmhNE3SQTw',
    appId: '1:261961189411:ios:37e2d30aa18a6596d28996',
    messagingSenderId: '261961189411',
    projectId: 'e-mart-afc02',
    storageBucket: 'e-mart-afc02.appspot.com',
    androidClientId: '261961189411-638segfrg4a0jor9ork1ssbjbm8jrvs9.apps.googleusercontent.com',
    iosClientId: '261961189411-p4qat9loaq68tho0v8b8f3dkk4dl6ls2.apps.googleusercontent.com',
    iosBundleId: 'com.example.eMart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB83glYXSPdIpUENov0_yvCXKmhNE3SQTw',
    appId: '1:261961189411:ios:e307f271bcaa6d75d28996',
    messagingSenderId: '261961189411',
    projectId: 'e-mart-afc02',
    storageBucket: 'e-mart-afc02.appspot.com',
    androidClientId: '261961189411-638segfrg4a0jor9ork1ssbjbm8jrvs9.apps.googleusercontent.com',
    iosClientId: '261961189411-52nmhd06qsg34tink338sgtb527b42nl.apps.googleusercontent.com',
    iosBundleId: 'com.example.eMart.RunnerTests',
  );
}
