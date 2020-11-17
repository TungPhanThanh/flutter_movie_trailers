import 'package:dio/dio.dart';

abstract class BaseRepo {
  BaseRepo(this.dio);
  Dio dio;
}
