import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    this.onesignal,
    String? subs,
  }) : this.subs = subs ?? 'sub';

  final String? onesignal;
  final String subs;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.95,
                    child: custom_widgets.CustomWebview(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.95,
                      url: 'https://tmppro.co.kr/app_login',
                      message: widget!.onesignal!,
                      subscription: widget!.subs,
                      token: FFAppState().token,
                      userId: FFAppState().userId,
                      getToken: (token) async {
                        FFAppState().token = token;
                        safeSetState(() {});
                      },
                      getId: (id) async {
                        FFAppState().userId = id;
                        safeSetState(() {});
                      },
                      appLogout: (userId) async {
                        FFAppState().token = 'token';
                        FFAppState().userId = 'userid';
                        safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
