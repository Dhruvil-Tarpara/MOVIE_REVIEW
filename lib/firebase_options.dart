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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKBSItqKnD_4SOfcCwku0zM8MPSQ55c74',
    appId: '1:893528955545:android:25caaf6774dce1f4133608',
    messagingSenderId: '893528955545',
    projectId: 'movie-review-877e0',
    storageBucket: 'movie-review-877e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqGctgvheZ8Mqm9dUJ5GoFO5yXLl0A23U',
    appId: '1:893528955545:ios:8639b91411798d36133608',
    messagingSenderId: '893528955545',
    projectId: 'movie-review-877e0',
    storageBucket: 'movie-review-877e0.appspot.com',
    androidClientId: '893528955545-8ne1rgqvvac31jbbgdqtf8r76padtoc7.apps.googleusercontent.com',
    iosClientId: '893528955545-grkmh1l6a2nl3j5qcgrgr9n8pe79mfs5.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieReview',
  );
}
