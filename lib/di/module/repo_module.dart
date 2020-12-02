import 'package:dio/dio.dart';
import 'package:flutter_movie/common/config/build_config.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/di/module/di_module.dart';
import 'package:flutter_movie/repository/model/service/genre_service.dart';
import 'package:flutter_movie/repository/model/service/movie_service.dart';
import 'package:flutter_movie/repository/remote/genre/genre_repo_impl.dart';
import 'package:flutter_movie/repository/remote/movie/movie_repo_impl.dart';

class RepoModule extends DIModule {
  RepoModule();

  @override
  provides() async {
    getIt.registerFactory(() => GenreRepoImpl(
        getIt<Dio>(), GenreService(getIt<Dio>(), baseUrl: BuildConfig.get().baseUrl)));
    getIt.registerFactory(() => MoviesRepoImpl(getIt<Dio>(),
        MovieService(getIt<Dio>(), baseUrl: BuildConfig.get().baseUrl)));
  }
}
