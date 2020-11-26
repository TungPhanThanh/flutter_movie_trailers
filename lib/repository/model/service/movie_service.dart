import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET()
}
