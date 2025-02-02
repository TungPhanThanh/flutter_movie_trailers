import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter_movie/common/config/evn.dart';
import 'package:flutter_movie/common/router/manifest.dart';
import 'package:flutter_movie/common/style/style.dart';
import 'package:flutter_movie/common/utils/Storage.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/page/application.dart';

import 'common/net/net.dart';

void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Container(color: Colors.transparent);
    };
    await Injection.inject();
    await Storage.getInstance();
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: mColorNavigationBar,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    HttpOverrides.global = MyHttpOverrides();
    await manifest(getIt<fluro.FluroRouter>());
    return Application();
  }
}
