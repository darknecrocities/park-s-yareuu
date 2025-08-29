// lib/firebase_options.dart
// Custom setup for your project: Park's Yareuu Bistro

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyAxHTFxfrgWCmoIdFLHfY6IChsF28sj_6Q",
    appId: "1:864914183110:android:e18db2814b6ce2f09098c7",
    messagingSenderId: "864914183110",
    projectId: "park-s-yareuu-bistro",
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyAxHTFxfrgWCmoIdFLHfY6IChsF28sj_6Q",
    appId: "1:864914183110:web:777b98de7fe5edc89098c7",
    messagingSenderId: "864914183110",
    projectId: "park-s-yareuu-bistro",
    authDomain: "park-s-yareuu-bistro.firebaseapp.com",
    storageBucket: "park-s-yareuu-bistro.appspot.com",
  );
}
