// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future newCustomAction() async {
  OneSignal.initialize('03178d2e-f57d-47a1-8450-0a07acc9bac9');

  OneSignal.Notifications.requestPermission(true);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
