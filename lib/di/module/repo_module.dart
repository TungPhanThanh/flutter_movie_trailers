import 'package:flutter_movie/common/config/build_config.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/di/module/di_module.dart';
import 'package:flutter_movie/repository/model/service/user_service.dart';
import 'package:dio/dio.dart';

class RepoModule extends DIModule {
  RepoModule();

  @override
  provides() async {
    // getIt.registerFactory(() => UserRepositoryImpl(getIt<Dio>(),
    //     UserService(getIt<Dio>(), baseUrl: BuildConfig.get().baseUrl)));
  }
}
