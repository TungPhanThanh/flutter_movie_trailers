import 'package:dio/dio.dart';
import 'package:flutter_movie/common/config/core/base_repo.dart';
import 'package:flutter_movie/common/utils/constants.dart';
import 'package:flutter_movie/repository/model/response/get_list_genre_res.dart';
import 'package:flutter_movie/repository/model/service/genre_service.dart';
import 'package:flutter_movie/repository/remote/genre/genre_repo.dart';

class GenreRepoImpl extends BaseRepo implements GenreRepo {
  GenreRepoImpl(Dio dio, this._genreService) : super(dio);

  final GenreService _genreService;

  @override
  Future<GetListGenreRes> getListGenre(
      {String apiKey = Constants.API_KEY, String language = 'en-US'}) {
    return _genreService.getListGenre(apiKey: apiKey, lang: language);
  }
}
