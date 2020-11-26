import 'package:flutter_movie/repository/model/response/get_list_genre_res.dart';

abstract class GenreRepo {
  Future<GetListGenreRes> getListGenre({String apiKey, String language});
}