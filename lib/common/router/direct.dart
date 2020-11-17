import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/utils/logging.dart';
import 'package:flutter_movie/di/injection/injection.dart';

/// define router navigate
class Direct{
  static void push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    getIt<fluro.FluroRouter>().navigateTo(context, path, replace: replace, clearStack: clearStack, transition: fluro.TransitionType.native);
  }

  static void pushResult(BuildContext context, String path, Function(dynamic) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    getIt<fluro.FluroRouter>().navigateTo(context, path, replace: replace, clearStack: clearStack, transition: fluro.TransitionType.native).then((result){
      function(result);
    }).catchError((error) {
      Log.severe('NavigatorUtils', '$error');
    });
  }

  /// Back
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  ///Return with parameters
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }
}