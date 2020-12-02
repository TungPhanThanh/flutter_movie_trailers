import 'package:dio/dio.dart';
import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/repository/model/response/get_list_movie_res.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET('movie/now_playing')
  Future<GetListMovieRes> getNowPlaying({
    @Query('api_key') String apiKey = Constants.API_KEY,
    @Query('language') String language = 'en-US',
    @Query('page') int page,
    @Query('region') String region,
  });

  @GET('movie/popular')
  Future<GetListMovieRes> getPopular({
    @Query('api_key') String apiKey = Constants.API_KEY,
    @Query('language') String language = 'en-US',
    @Query('page') int page,
    @Query('region') String region,
  });

  @GET('movie/top_rated')
  Future<GetListMovieRes> getTopRate({
    @Query('api_key') String apiKey = Constants.API_KEY,
    @Query('language') String language = 'en-US',
    @Query('page') int page,
    @Query('region') String region,
  });

  @GET('movie/upcoming')
  Future<GetListMovieRes> getUpcoming({
    @Query('api_key') String apiKey = Constants.API_KEY,
    @Query('language') String language = 'en-US',
    @Query('page') int page,
    @Query('region') String region,
  });
}
