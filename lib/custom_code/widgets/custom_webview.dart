// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';

import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  const CustomWebview({
    Key? key,
    this.width,
    this.height,
    required this.url,
    required this.message,
    required this.token,
    required this.subscription,
    required this.getToken,
    required this.getId,
    required this.userId,
    required this.appLogout,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;
  final String message;
  final String token;
  final String subscription;
  final String userId;
  final Future<dynamic> Function(String token) getToken;
  final Future<dynamic> Function(String id) getId;
  final Future<dynamic> Function(String userId) appLogout;
  @override
  _CustomWebviewState createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _executeJavaScript();
          },
        ),
      )
      ..addJavaScriptChannel(
        'toAppToken',
        onMessageReceived: (JavaScriptMessage message) async {
          print("Received message from JavaScript: ${message.message}");
          try {
            await widget.getToken(message.message);
            print("getToken function completed successfully");
          } catch (e) {
            print("Error in getToken: $e");
          }
        },
      )
      ..addJavaScriptChannel(
        'toAppLogout',
        onMessageReceived: (JavaScriptMessage message) async {
          print("Received message from JavaScript: ${message.message}");
          try {
            await widget.appLogout(message.message);
            print("appLogout function completed successfully");
          } catch (e) {
            print("Error in appLogout: $e");
          }
        },
      )
      ..addJavaScriptChannel(
        'toAppId',
        onMessageReceived: (JavaScriptMessage message) {
          print("Received data from web: ${message.message}");
          widget.getId(message.message);
        },
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _executeJavaScript() {
    _controller.runJavaScript('''
    window.FlutterApp = {
      postMessage: function(message) {
        FlutterApp.postMessage(message);
      }
    };
    window.testHandle = {
      postMessage: function(message) {
        testHandle.postMessage(message);
      }
    };
    
    // 기존 코드
    setOneSignalId("${widget.message}");
    setSubscriptionID("${widget.subscription}");
    setAutoLoginToken("${widget.token}");
    setAutoLoginId("${widget.userId}");
  ''');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: WebViewWidget(controller: _controller),
    );
  }
}
