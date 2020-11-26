import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/repository/model/response/get_list_genre_res.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'genre_service.g.dart';

@RestApi()
abstract class GenreService {
  factory GenreService(Dio dio, {String baseUrl}) = _GenreService;

  @GET('genre/movie/list')
  Future<GetListGenreRes> getListGenre({
    @Query('api_key') String apiKey = Constants.API_KEY,
    @Query('language') String lang = 'en-US',
  });
}