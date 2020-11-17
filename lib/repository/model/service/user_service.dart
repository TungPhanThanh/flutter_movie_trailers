import 'package:flutter_movie/repository/model/request/login_req.dart';
import 'package:flutter_movie/repository/model/response/login_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

/// command 'flutter pub run build_runner build'
@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('user')
  Future<UserRes> getDetail(@Path('id') String id);

  @POST('api/login')
  Future<UserRes> login(@Body() LoginReq request);

}
