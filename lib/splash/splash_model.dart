import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'splash_widget.dart' show SplashWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashModel extends FlutterFlowModel<SplashWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getOneSignalId] action in Splash widget.
  String? oneSignalId;
  // Stores action output result for [Custom Action - getSubscriptionId] action in Splash widget.
  String? subs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
