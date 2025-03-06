// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<String?> getSubscriptionId() async {
  String? subscriptionId;
  try {
    subscriptionId = await OneSignal.User.pushSubscription.id;
  } catch (e) {
    print('Error getting OneSignal Subscription ID: $e');
  }
  return subscriptionId;
}
