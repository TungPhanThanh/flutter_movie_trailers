import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/router/router_define.dart';
import 'package:flutter_movie/di/injection/injection.dart';
import 'package:flutter_movie/page/genre/bloc/genre_bloc.dart';
import 'package:flutter_movie/page/home/bloc/bloc.dart';
import 'package:flutter_movie/page/home/page/home_page.dart';

class HomeRouter extends RouterDefine<BlocProvider> {

  static const String PATH = '/home';

  // Simple push only
  static void launch(context) {
    direct().path(PATH).push(context, clearStack: true);
  }

  // Simple push and result
  static void launchAndResult(context, Function(dynamic) function) {
    direct().path(PATH).pushResult(context, function);
  }

  @override
  List<String> definePaths() => [PATH];

  @override
  BlocProvider initPage(context, param) => BlocProvider<HomeBloc>(
    create: (context) => getIt<HomeBloc>(),
    child: BlocProvider<GenreBloc>(
      create: (context) => getIt<GenreBloc>(),
      child: HomePage(),
    )
  );
}
