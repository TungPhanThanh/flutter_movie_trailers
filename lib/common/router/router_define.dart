import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/router/direct.dart';

_Bundle direct() => _Bundle();

/// identify the screen PATH and handle the params before direct to handle the UI
abstract class RouterDefine<PAGE extends Widget> {
  void initRouter(fluro.FluroRouter router) {
    final handler = fluro.Handler(handlerFunc: (context, param) {
      return initPage(context, param);
    });

    final paths = definePaths();

    for (var path in paths) {
      router.define(path, handler: handler);
    }
  }

  PAGE initPage(context, param);

  List<String> definePaths();
}

class _Bundle {
  _Parameters path(String path) {
    return _Parameters(path);
  }
}

/// handle params
class _Parameters {
  _Parameters(this._path);

  final String _path;
  Map<String, String> _parameters = {};

  _Direct param(Map<String, String> parameters) {
    _parameters = parameters;
    return _Direct(_pathToString());
  }

  String _pathToString() =>
      Uri(path: _path, queryParameters: _parameters).toString();

  void push(BuildContext context,
      {bool replace = false, bool clearStack = false}) {
    _Direct(_pathToString())
        .push(context, replace: replace, clearStack: clearStack);
  }

  void pushResult(BuildContext context, Function(dynamic) function,
      {bool replace = false, bool clearStack = false}) {
    _Direct(_pathToString()).pushResult(context, function,
        replace: replace, clearStack: clearStack);
  }
}

/// Direct screen
class _Direct {
  _Direct(this._path);

  final String _path;

  void push(BuildContext context,
      {bool replace = false, bool clearStack = false}) {
    Direct.push(context, _path, replace: replace, clearStack: clearStack);
  }

  void pushResult(BuildContext context, Function(dynamic) function,
      {bool replace = false, bool clearStack = false}) {
    Direct.pushResult(context, _path, function,
        replace: replace, clearStack: clearStack);
  }
}
