library env;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_movie/common/config/build_config.dart';
import 'package:flutter_movie/common/style/style.dart';
import 'package:flutter_movie/common/widgets/device_info_dialog.dart';

part 'src/flavor_banner.dart';
part 'src/flavor_widget.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await const MethodChannel('flavor')
          .invokeMethod<String>('getFlavor')
          .then((String flavor) async {
        BuildConfig.init(flavor: flavor);
      }).catchError((error) {});

      final StatefulWidget app = await onCreate();
      runApp(app);
    }, onError: (Object obj, StackTrace stack) {
      print(obj);
      print(stack);
    });
  }

  FutureOr<StatefulWidget> onCreate();
}