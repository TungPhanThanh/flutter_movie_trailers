import 'package:flutter_movie/repository/model/entity/movie.dart';
import 'package:flutter_movie/repository/model/response/get_list_movie_res.dart';

abstract class MovieRepo {
  Future<GetListMovieRes> getListNowPlaying({
    String apiKey,
    String language,
    int page,
    String region,
  });

  Future<GetListMovieRes> getListPopular({
    String apiKey,
    String language,
    int page,
    String region,
  });

  Future<GetListMovieRes> getListTopRated({
    String apiKey,
    String language,
    int page,
    String region,
  });

  Future<GetListMovieRes> getListUpcoming({
    String apiKey,
    String language,
    int page,
    String region,
  });

  Future<Movie> getDetailMovie(String movieId);
}
