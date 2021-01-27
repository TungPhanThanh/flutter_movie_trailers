import 'package:fluro/fluro.dart';
import 'package:flutter_movie/common/router/router_define.dart';
import 'package:flutter_movie/common/router/routes.dart';
import 'package:flutter_movie/common/utils/logging.dart';
import 'package:flutter_movie/page/detail_movie/detail_movie_router.dart';
import 'package:flutter_movie/page/genre/genre_router.dart';
import 'package:flutter_movie/page/home/home_router.dart';
import 'package:flutter_movie/page/splash/splash_router.dart';

List<RouterDefine> _listRouter = [];

Future manifest(FluroRouter router) async {
  ///Specify route jump error return page
  router.notFoundHandler = Handler(handlerFunc: (context, params) {
    Log.severe('routesConfigure', 'route was not found !!!');
    return NotFoundWidget();
  });

  _listRouter.clear();

  _listRouter.add(SplashRouter());
  _listRouter.add(HomeRouter());
  _listRouter.add(GenreRouter());
  _listRouter.add(DetailMovieRouter());

  await _initRouter(_listRouter, router);
}

_initRouter(List<RouterDefine> listRouters, router) async {
  for (var routerProfile in _listRouter) {
    routerProfile.initRouter(router);
  }
}