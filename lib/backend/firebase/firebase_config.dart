import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCz276DNjjrap2_iVj5XoL5F7OaYoG-ygk",
            authDomain: "projecttmp-33b41.firebaseapp.com",
            projectId: "projecttmp-33b41",
            storageBucket: "projecttmp-33b41.firebasestorage.app",
            messagingSenderId: "654427105668",
            appId: "1:654427105668:web:e56bccf163d46a87d3d5d1",
            measurementId: "G-WVWNMESVP4"));
  } else {
    await Firebase.initializeApp();
  }
}
