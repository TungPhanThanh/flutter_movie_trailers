import 'package:flutter_movie/common/config/core/base_bloc.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/page/splash/bloc/splash_event.dart';
import 'package:flutter_movie/page/splash/bloc/splash_state.dart';
import 'package:flutter_movie/repository/preferences/sessions_pref.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.nothing());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is AppStarted) {
      yield const SplashState.nothing();
    }
  }

  Future<bool> isLogined() async {
    final token = await getIt<SessionsPref>().getAccessToken() ?? '';
    return token.isNotEmpty;
  }
}
