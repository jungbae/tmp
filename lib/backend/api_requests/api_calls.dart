import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendPushNotificationCall {
  static Future<ApiCallResponse> call({
    String? deviceToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": {
    "token": "${escapeStringForJson(deviceToken)}",
    "notification": {
      "title": "FCM 메시지",
      "body": "이것은 FCM 알림 메시지입니다!"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendPushNotification',
      apiUrl:
          'https://fcm.googleapis.com/v1/projects/projecttmp-33b41/messages:send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImE3MWI1MTU1MmI0ODA5OWNkMGFkN2Y5YmZlNGViODZiMDM5NmUxZDEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvamVjdHRtcC0zM2I0MSIsImF1ZCI6InByb2plY3R0bXAtMzNiNDEiLCJhdXRoX3RpbWUiOjE3MzU0ODA3MjUsInVzZXJfaWQiOiI4Vk9LVmJId1JHZ3V5NFFBWUU5c1ZLNHRGSkEyIiwic3ViIjoiOFZPS1ZiSHdSR2d1eTRRQVlFOXNWSzR0RkpBMiIsImlhdCI6MTczNTQ4MDcyNSwiZXhwIjoxNzM1NDg0MzI1LCJlbWFpbCI6ImNqbWZvcnR1bmVAbmF2ZXIuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbImNqbWZvcnR1bmVAbmF2ZXIuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.Vg4SF7auV2SKEJDcmFXk_T6TNvB6-2LfZyavj4sCJ3RrKlXJF7maI1DvWAWqiTavhXgZrb004FU_Lx13CIWTQgeSlWhNJOslZM9CeDtDlwlQ-9vbaNzjhLBRN-Fcp-1pyK8vluRaFRg8ffyVL7ArhpeiF3gz9V5fTH_vqBoC5w3VE-XyEdz3rNX-NbEn-KKwhCVBQKRoBbXsQzVQRi_RzPcdfGKh6z0cKljnSgSS4YODtyWVs9Jd7-ekHejrdND5AcISMIkpoIfzY6L7aCBbjMjjP5HclIav2nmRnNKUx8_nFUozwEyDyzUB5lb7t0lEkxKBGlazQ5m1CvdaCM-M3g',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
