import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/di/module/di_module.dart';
import 'package:fluro/fluro.dart';

class ComponentModule extends DIModule{
  @override
  provides() {
    getIt.registerSingleton(FluroRouter());
  }
}