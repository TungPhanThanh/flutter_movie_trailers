import 'package:flutter_movie/common/router/router_define.dart';
import 'package:flutter_movie/page/splash/page/splash_page.dart';

///Splash router define
class SplashRouter extends RouterDefine<SplashPage> {
  static const String PATH = '/splash';
  static const String PATH_ROOT = '/';

  static const String PARAM_ID = '_id';

  static void launch(context, {String id}) {
    direct().path(PATH).param({}).push(context, clearStack: true);
  }

  static void launchAndResult(context, Function(dynamic) function) {
    direct().path(PATH).pushResult(context, function);
  }

  @override
  List<String> definePaths() => [PATH, PATH_ROOT];

  @override
  initPage(context, param) => SplashPage();
}
