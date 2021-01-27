import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/router/router_define.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:flutter_movie/page/detail_movie/page/detail_movie_page.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';

class DetailMovieRouter extends RouterDefine<BlocProvider> {
  ///path define
  static const String PATH = '/detail_movie';
  static const String MOVIE_KEY = 'movie_key';

  ///Simple push
  static void launch(context, Movie movie) {
    final map = {MOVIE_KEY: jsonEncode(movie.toJson())};
    direct().path(PATH).param(map).push(context);
  }

  ///Simple push and result
  static void launchAndResult(context, Function(dynamic) function) {
    direct().path(PATH).pushResult(context, function);
  }

  @override
  BlocProvider initPage(context, param) => BlocProvider<DetailMovieBloc>(
        create: (context) => getIt<DetailMovieBloc>(),
        child: DetailMoviePage(
          movie: Movie.fromJson(jsonDecode(param[MOVIE_KEY][0])),
        ),
      );

  @override
  List<String> definePaths() => [PATH];
}
