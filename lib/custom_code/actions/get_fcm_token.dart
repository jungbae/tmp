// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFcmToken() async {
  // get fcmtoken  from firebase and return it
  final FirebaseMessaging fcm = FirebaseMessaging.instance;
  String token = await fcm.getToken() ?? '';

  return token;
}
