import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/di/module/di_module.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:flutter_movie/page/genre/bloc/genre_bloc.dart';
import 'package:flutter_movie/page/home/bloc/bloc.dart';
import 'package:flutter_movie/page/splash/bloc/bloc.dart';
import 'package:flutter_movie/repository/preferences/sessions_pref.dart';
import 'package:flutter_movie/repository/remote/genre/genre_repo_impl.dart';
import 'package:flutter_movie/repository/remote/movie/movie_repo_impl.dart';

class BlocModule extends DIModule {
  @override
  provides() {
    getIt.registerFactory(() => SplashBloc());
    getIt.registerFactory(() => GenreBloc(getIt<GenreRepoImpl>()));
    getIt.registerFactory(() => HomeBloc(getIt<MoviesRepoImpl>()));
    getIt.registerFactory(() => DetailMovieBloc(getIt<MoviesRepoImpl>(), getIt<SessionsPref>()));
  }
}
