import 'package:dio/dio.dart';
import 'package:flutter_movie/common/config/core/base_repo.dart';
import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/repository/model/response/get_list_movie_res.dart';
import 'package:flutter_movie/repository/model/service/movie_service.dart';
import 'package:flutter_movie/repository/remote/movie/movie_repo.dart';

class MoviesRepoImpl extends BaseRepo implements MovieRepo {
  MoviesRepoImpl(Dio dio, this._movieService) : super(dio);
  final MovieService _movieService;

  @override
  Future<GetListMovieRes> getListNowPlaying({
    String apiKey = Constants.API_KEY,
    String language = 'en-US',
    int page,
    String region,
  }) {
    return _movieService.getNowPlaying(
      apiKey: apiKey,
      language: language,
      page: page,
      region: region,
    );
  }

  @override
  Future<GetListMovieRes> getListPopular({
    String apiKey = Constants.API_KEY,
    String language = 'en-US',
    int page,
    String region,
  }) {
    return _movieService.getPopular(
      apiKey: apiKey,
      language: language,
      page: page,
      region: region,
    );
  }

  @override
  Future<GetListMovieRes> getListTopRated({
    String apiKey = Constants.API_KEY,
    String language = 'en-US',
    int page,
    String region,
  }) {
    return _movieService.getTopRate(
      apiKey: apiKey,
      language: language,
      page: page,
      region: region,
    );
  }

  @override
  Future<GetListMovieRes> getListUpcoming({
    String apiKey = Constants.API_KEY,
    String language = 'en-US',
    int page,
    String region,
  }) {
    return _movieService.getUpcoming(
      apiKey: apiKey,
      language: language,
      page: page,
      region: region,
    );
  }
}
