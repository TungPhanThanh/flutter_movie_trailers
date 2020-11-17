import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/di/module/di_module.dart';
import 'package:flutter_movie/page/splash/bloc/bloc.dart';

class BlocModule extends DIModule {
  @override
  provides() {
    getIt.registerFactory(() => SplashBloc());
  }
}
