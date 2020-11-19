import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/router/router_define.dart';

class GenreRouter extends RouterDefine<BlocProvider> {

  static const String PATH = '/genre';

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
  BlocProvider<Cubit<Object>> initPage(context, param) {
    // TODO: implement initPage
    throw UnimplementedError();
  }

}